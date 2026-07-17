#!/bin/bash
# Claude Code status line, three sections across the full terminal width (COLUMNS):
#   left: cwd · git branch (dirty/sync markers)   center: model (effort)   right: context · lines · cost · duration
set -euo pipefail

# UTF-8 locale so ${#var} counts characters (✗, ·, ↑, ↓), not bytes
export LC_ALL=en_US.UTF-8 2>/dev/null || true

input=$(cat)

# One jq pass for every field, empty string when absent. Unit separator (\x1f)
# instead of tab because read collapses runs of IFS whitespace, eating empty fields
IFS=$'\x1f' read -r model dir used_tokens size_tokens pct cost_usd effort lines_added lines_removed duration_ms <<EOF
$(jq -r '[
  (.model.display_name // ""),
  (.workspace.current_dir // ""),
  (.context_window.total_input_tokens // ""),
  (.context_window.context_window_size // ""),
  (.context_window.used_percentage // ""),
  (.cost.total_cost_usd // ""),
  (.effort.level // ""),
  (.cost.total_lines_added // ""),
  (.cost.total_lines_removed // ""),
  (.cost.total_duration_ms // "")
] | map(tostring) | join("\u001f")' <<< "$input")
EOF

dir_display="${dir/#$HOME/\~}"

RESET='\033[0m'
DIM='\033[2m'
DIR_COLOR='\033[34m'
BRANCH_COLOR='\033[32m'
DIRTY_COLOR='\033[31m'
SYNC_COLOR='\033[33m'
MODEL_COLOR='\033[36m'
COST_COLOR='\033[35m'
ADD_COLOR='\033[32m'
DEL_COLOR='\033[31m'

SEP=" ${DIM}·${RESET} "

branch=""
dirty=""
sync=""
if git -C "$dir" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null || true)
  if [ -n "$(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
    dirty=" ✗"
  fi
  # "<behind> <ahead>" relative to upstream, empty when no upstream is set
  counts=$(git -C "$dir" --no-optional-locks rev-list --left-right --count '@{upstream}...HEAD' 2>/dev/null || true)
  if [ -n "$counts" ]; then
    behind="${counts%%[[:space:]]*}"
    ahead="${counts##*[[:space:]]}"
    [ "$ahead" != "0" ] && sync=" ↑${ahead}"
    [ "$behind" != "0" ] && sync="${sync} ↓${behind}"
  fi
fi

# 85 -> 85, 8500 -> 8.5k, 85200 -> 85k, 1000000 -> 1M
fmt_tokens() {
  awk -v n="$1" 'BEGIN {
    if (n >= 1000000)    printf (n % 1000000 == 0 ? "%dM" : "%.1fM"), n / 1000000
    else if (n >= 10000) printf "%dk", n / 1000
    else if (n >= 1000)  printf (n % 1000 == 0 ? "%dk" : "%.1fk"), n / 1000
    else                 printf "%d", n
  }'
}

# Context color tracks usage: green < 40%, yellow 40-69%, red >= 70% (autocompact at 85%)
ctx=""
CTX_COLOR='\033[33m'
if [ -n "$pct" ]; then
  pct_int=$(printf '%.0f' "$pct")
  if [ "$pct_int" -ge 70 ]; then
    CTX_COLOR='\033[31m'
  elif [ "$pct_int" -lt 40 ]; then
    CTX_COLOR='\033[32m'
  fi
fi
if [ -n "$used_tokens" ] && [ -n "$size_tokens" ]; then
  ctx="$(fmt_tokens "$used_tokens")/$(fmt_tokens "$size_tokens")"
  [ -n "$pct" ] && ctx="$ctx ${pct_int}%"
elif [ -n "$pct" ]; then
  ctx="${pct_int}%"
fi

cost=""
[ -n "$cost_usd" ] && cost="\$$(printf '%.2f' "$cost_usd")"

lines=""
if [ -n "$lines_added" ] || [ -n "$lines_removed" ]; then
  lines="${ADD_COLOR}+${lines_added:-0}${RESET}${DIM}/${RESET}${DEL_COLOR}-${lines_removed:-0}${RESET}"
fi

duration=""
if [ -n "$duration_ms" ]; then
  secs=$(printf '%.0f' "$duration_ms")
  secs=$((secs / 1000))
  if [ "$secs" -ge 3600 ]; then
    duration="$((secs / 3600))h $(( (secs % 3600) / 60 ))m"
  elif [ "$secs" -ge 60 ]; then
    duration="$((secs / 60))m"
  else
    duration="${secs}s"
  fi
fi

# Sections
left="${DIR_COLOR}${dir_display}${RESET}"
if [ -n "$branch" ]; then
  left="${left}${SEP}${BRANCH_COLOR}${branch}${RESET}${DIRTY_COLOR}${dirty}${RESET}${SYNC_COLOR}${sync}${RESET}"
fi

center="${MODEL_COLOR}${model}${RESET}"
[ -n "$effort" ] && center="${center} ${DIM}(${effort})${RESET}"

right_parts=()
[ -n "$ctx" ] && right_parts+=("${CTX_COLOR}${ctx}${RESET}")
[ -n "$lines" ] && right_parts+=("$lines")
[ -n "$cost" ] && right_parts+=("${COST_COLOR}${cost}${RESET}")
[ -n "$duration" ] && right_parts+=("${DIM}${duration}${RESET}")

right=""
for part in "${right_parts[@]:-}"; do
  [ -z "$part" ] && continue
  if [ -z "$right" ]; then
    right="$part"
  else
    right="${right}${SEP}${part}"
  fi
done

# Visible length: expand escapes, then strip ANSI color codes
visible_len() {
  local expanded stripped
  expanded=$(printf '%b' "$1")
  stripped=$(printf '%s' "$expanded" | sed $'s/\x1b\\[[0-9;]*m//g')
  printf '%s' "${#stripped}"
}

# The status line area has built-in spacing, so the full COLUMNS width overflows
# and gets ellipsis-truncated. Keep a safety margin off the right edge.
cols="$(( ${COLUMNS:-0} - 4 ))"
if [ "$cols" -gt 0 ]; then
  l_len=$(visible_len "$left")
  c_len=$(visible_len "$center")
  r_len=$(visible_len "$right")
  # Center the model on the terminal midpoint, then pad the remainder before right
  gap1=$(( (cols - c_len) / 2 - l_len ))
  gap2=$(( cols - l_len - gap1 - c_len - r_len ))
  if [ "$gap1" -ge 1 ] && [ "$gap2" -ge 1 ]; then
    printf '%b%*s%b%*s%b' "$left" "$gap1" "" "$center" "$gap2" "" "$right"
    exit 0
  fi
fi

# No width info or terminal too narrow: plain separators
out="${left}${SEP}${center}"
[ -n "$right" ] && out="${out}${SEP}${right}"
printf '%b' "$out"
