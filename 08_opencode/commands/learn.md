---
description: Extract reusable patterns from this session into learned skills or AGENTS.md rules
---

Analyze this session for reusable patterns worth saving.

## Pattern Types

- **User corrections** - Where user corrected your approach
- **Error resolutions** - How errors were diagnosed and fixed
- **Workarounds** - Solutions to framework/library quirks
- **Debugging techniques** - Approaches that worked
- **Project conventions** - Patterns specific to this codebase

## Destination Decision

Patterns can be saved to two locations:

| Destination | Content Type | Scope | Examples |
|-------------|--------------|-------|----------|
| **AGENTS.md** | Behavioral rules, preferences | Global | "Ask before committing", "Don't take shortcuts" |
| **Skills** | Technical patterns, techniques | Project/Tech | "Use atomic.Bool for test races", "Fix nestif with helpers" |

### Detection Heuristics

Check if pattern contains **behavioral keywords**:
- Imperatives: "don't", "never", "always", "stop", "avoid"
- Preferences: "I prefer", "I want you to", "should have"
- Process: "ask before", "ask first", "without asking"
- Meta: "lazy", "shortcut", "careful", "thorough"

**If behavioral keywords detected** → Ask user: "This looks like a behavioral preference. Save to AGENTS.md or as a Skill?"

**If no behavioral keywords** → Default to Skill, confirm with user

## Instructions

1. **Determine save locations**
   - Skills: `./.opencode/skills/` (current working directory)
   - Global AGENTS.md: `~/.config/opencode/AGENTS.md`
   - Project AGENTS.md: `<git-root>/AGENTS.md` (run `git rev-parse --show-toplevel`)

2. **Scan existing content**
   - Read `./.opencode/skills/*/SKILL.md` if directory exists
   - Read `~/.config/opencode/skills/*/SKILL.md` for global skills reference
   - Read `~/.config/opencode/AGENTS.md` for global behavioral rules
   - Read `<git-root>/AGENTS.md` if it exists for project-specific rules

3. **Analyze session** - Identify 1-3 patterns worth extracting

4. **For each pattern:**
   - Check for behavioral keywords
   - Use question tool to confirm destination and details
   - If AGENTS.md: identify which section it belongs to
   - If Skill: check for existing similar skill to merge

5. **For Skills, decide action:**
   - Same sub-domain + <300 lines → merge (add to `## Patterns` section)
   - Same sub-domain + ≥300 lines → ask: merge or create new?
   - Different sub-domain → create new skill

6. **For AGENTS.md:**
   - Ask user: project-specific or global rule?
     - Project-specific → `<git-root>/AGENTS.md`
     - Global → `~/.config/opencode/AGENTS.md`
   - Identify the appropriate section (Behavior, Scope, Code Principles, etc.)
   - Add as a new bullet point in that section
   - Keep rules concise (one line if possible)

7. **Summarize** what was saved/merged

## Naming Convention (Skills)

Use medium-grained names for coherent sub-domains:

| Too Broad | Too Narrow | Just Right |
|-----------|------------|------------|
| golang-testing | golang-mock-http | golang-test-doubles |
| react-patterns | react-useeffect-cleanup | react-hooks-lifecycle |

## Skill Template (new skills)

```markdown
---
name: [sub-domain-name]
description: [Specific description. What it does AND when to use. Include keywords. Max 1024 chars.]
---

# [Sub-Domain Name]

## Overview

[What this sub-domain covers - 1-2 sentences]

## Patterns

### [Pattern Name]
**When:** [specific trigger]
**Pattern:** [the technique]
**Example:** [if helpful]
```

## AGENTS.md Template (new rules)

Add to the appropriate section:

```markdown
## [Existing Section Name]
- [Existing rules...]
- [New rule - concise, actionable]
```

## Merge Template (Skills)

Append to existing `## Patterns` section:

```markdown
### [New Pattern Name]
**When:** [trigger]
**Pattern:** [technique]
```

## Rules

- Skill `name`: lowercase, hyphens only, max 64 chars
- Skill `description`: specific enough to match searches
- Skills: Keep under 500 lines (warn at 300)
- AGENTS.md rules: Keep concise, one line preferred
- Be concrete, not abstract

## Complex Skills

For skills needing scripts, references, or assets, use the `skill-creator` skill instead.
