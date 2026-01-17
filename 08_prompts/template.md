## Behavior
- Ask before making significant changes
- Ask before creating or modifying README and documentation files
- Ask before adding new dependencies
- When uncertain about requirements or approach, ask clarifying questions before proceeding

## Scope Discipline
- Complete the requested task, nothing more
- Do not fix unrelated issues; report them instead
- Do not refactor beyond what is explicitly requested
- Prefer editing existing files over creating new ones
- When scope creep is tempting, ask first

## Git & Pull Requests
- Use Conventional Commits: `type(scope): description`
- Keep commits focused and atomic (one logical change per commit)
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

### History rewriting
- Do not use `git commit --amend` on commits that have been pushed
- If a pushed commit needs fixing, create a new commit

### Pull request reviews
- Use Conventional Commits format for PR title
- Keep description concise
- Use Conventional Comments: `label: subject`
  - `praise:` - Highlight something done well
  - `nitpick:` - Minor style/preference, non-blocking
  - `suggestion:` - Propose an alternative approach
  - `issue:` - Something that must be addressed
  - `question:` - Seeking clarification or understanding
  - `thought:` - Share an idea without requiring action

## Code Principles

### Design
- Prefer library-provided utilities over custom implementations
- Prefer small, focused functions over large monolithic ones
- Prefer explicit over implicit behavior
- Prefer composition over inheritance
- Prefer immutability where practical
- Prefer simple code over unnecessary abstractions
- Prefer changing code directly over adding backwards-compat layers

### Style
- Run formatters before committing; do not manually format code
- Follow language-specific conventions
- Do not change formatting in code you are not modifying

### Naming & comments
- Prefer descriptive names over comments
- Avoid comments unless they add real value
- Prefer deleting dead code over commenting it out
- Do not leave TODOs or FIXMEs without clear context
- Do not add `// TODO: implement` without actually implementing

### Error handling
- Handle errors at appropriate boundaries (API, user input, external calls)
- Propagate errors with context rather than swallowing them
- Prefer returning errors over panicking/throwing
- Fail fast on programmer errors; handle gracefully on user/external errors
- Do not add defensive checks for conditions the type system already prevents

## Context Awareness
- Study existing patterns before introducing new ones
- Match the style and conventions already present in the codebase
- When multiple approaches exist, ask which to follow
- If existing code uses suboptimal patterns, suggest improvements but ask before applying
- Do not delete code without understanding why it exists
- Fix root causes, not symptoms

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
