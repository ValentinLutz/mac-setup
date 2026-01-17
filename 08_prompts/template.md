## Behavior
- Ask before making significant changes
- Ask before creating or modifying README and documentation files
- Ask before adding new dependencies
- When uncertain about requirements or approach, ask clarifying questions before proceeding
- Prefer fixing the root cause over adding workarounds

## Scope Discipline
- Complete the requested task, nothing more
- Do not fix unrelated issues; report them instead
- Do not refactor across multiple files unless explicitly requested
- Do not create new files when editing existing ones would suffice
- When scope creep is tempting, ask first

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Keep commits focused and atomic
- Subject line only, no body
- Do not add Co-Authored-By lines

### Commit types
Trigger release: `feat`, `fix`, `perf`
No release: `docs`, `style`, `refactor`, `test`, `chore`, `build`, `ci`

### Breaking changes
Add `!` after type (or scope) to indicate a breaking change that affects external consumers.

For services: API contract changes (endpoints, request/response formats, auth flows)
For libraries: Public API changes (exported functions, types, interfaces)

When uncertain if a change is breaking, ask before committing.

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
- Follow language-specific conventions
- Do not manually format code; rely on automated formatters
- Do not change formatting or style in code you're not modifying
- Do not leave TODOs or FIXMEs without clear context
- Do not add `// TODO: implement` without actually implementing

## Code Design
- Prefer library-provided utilities over custom implementations
- Prefer small, focused functions over large monolithic ones
- Prefer explicit over implicit behavior
- Prefer composition over inheritance
- Prefer immutability where practical
- Prefer descriptive names over comments; avoid comments unless they add real value
- Prefer deleting dead code over commenting it out
- Prefer changing code directly over adding backwards-compat layers
- Prefer simple code over unnecessary abstractions

## Context Awareness
- Study existing patterns before introducing new ones
- Match the style and conventions already present in the codebase
- When multiple approaches exist in the codebase, ask which to follow
- If existing code uses suboptimal patterns, suggest better practices but ask before applying them
- Do not delete code without understanding why it exists

## Error Handling
- Handle errors at appropriate boundaries (API, user input, external calls)
- Do not add defensive checks for conditions the type system already prevents
- Propagate errors with context rather than swallowing them
- Fail fast on programmer errors; handle gracefully on user/external errors
- Prefer returning errors over panicking/throwing

## Testing
- Use given-when-then pattern:
  - given: setup and preconditions
  - when: action being tested
  - then: expected outcome
- Use comments to mark each section when helpful

## Questions & Decisions
- Use the question tool when available to present choices
- When asking questions, provide concrete options with a recommended choice marked "(Recommended)"
- Do not ask open-ended questions when choices can be enumerated
- Prefer selecting from options over requiring typed input

## Build Tools & CLI
- Prefer CLI tools over manual code manipulation
- Use Makefile if project has one
- Use Mage if project has magefile.go
- Common targets: build, test, lint, fmt
- Use project linters and formatters when available
- Run tests through project tooling, not manually
