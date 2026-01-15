## Behavior
- Ask before making significant changes
- Ask before creating or modifying README and documentation files
- Ask before adding new dependencies
- When uncertain about requirements or approach, ask clarifying questions before proceeding

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore
- Keep commits focused and atomic
- Subject line only, no body
- Never add Co-Authored-By lines

## Pull Requests
- Use Conventional Commits format for PR title
- Keep description concise
- Use Conventional Comments for reviews: `label: subject`
- Labels and when to use them:
  - `praise:` - Highlight something done well
  - `nitpick:` - Minor style/preference, non-blocking
  - `suggestion:` - Propose an alternative approach
  - `issue:` - Something that must be addressed
  - `question:` - Seeking clarification or understanding
  - `thought:` - Share an idea without requiring action

## Code Style
- Run formatters before committing
- No comments unless they add real value
- Follow language-specific conventions

## Context Awareness
- Study existing patterns before introducing new ones
- Match the style and conventions already present in the codebase
- When multiple approaches exist in the codebase, ask which to follow
- If existing code uses suboptimal patterns, suggest better practices but ask before applying them
- Don't "fix" inconsistencies outside the scope of the current task

## Prefer
- Prefer small, focused functions over large monolithic ones
- Prefer explicit over implicit behavior
- Prefer composition over inheritance
- Prefer returning errors over panicking/throwing
- Prefer immutability where practical
- Prefer descriptive names over comments
- Prefer deleting dead code over commenting it out
- Prefer fixing the root cause over adding workarounds

## Error Handling
- Handle errors at appropriate boundaries (API, user input, external calls)
- Don't add defensive checks for conditions the type system already prevents
- Propagate errors with context rather than swallowing them
- Fail fast on programmer errors; handle gracefully on user/external errors

## Testing
- Use given-when-then pattern:
  - given: setup and preconditions
  - when: action being tested
  - then: expected outcome
- Use comments to mark each section when helpful

## Questions & Decisions
- Use the question tool when available to present choices
- When asking questions, provide concrete options with a recommended choice marked "(Recommended)"
- Never ask open-ended questions when choices can be enumerated
- Prefer selecting from options over requiring typed input

## Build Tools & CLI
- Prefer CLI tools over manual code manipulation
- Use Makefile if project has one
- Use Mage if project has magefile.go
- Common targets: build, test, lint, fmt
- Use project linters and formatters when available
- Run tests through project tooling, not manually

## Avoid
- Never add abstractions, patterns, or flexibility that isn't needed
- Never make unrelated changes or improvements outside the task
- Never add comments that restate the code
- Never add libraries without asking
- Never change formatting or style in code you're not modifying
- Never leave TODOs or FIXMEs without clear context
- Never delete code without understanding why it exists
- Never add backwards-compat layers when you can just change the code
- Never add `// TODO: implement` without actually implementing
- Never comment out code, delete it
