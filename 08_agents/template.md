## Behavior
- Ask before making significant changes
- Can suggest improvements, but ask before implementing them
- Ask before creating or modifying README and documentation files
- Ask before adding new dependencies

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore
- Keep commits focused and atomic
- Subject line only, no body
- Never add Co-Authored-By lines

## Pull Requests
- Use Conventional Commits format for PR title
- Keep description concise
- Use Conventional Comments for reviews: `<label>: <subject>`
- Labels: praise, nitpick, suggestion, issue, question, thought

## Code Style
- Run formatters before committing
- No comments unless they add real value
- Follow language-specific conventions

## Testing
- Use given-when-then pattern:
  - given: setup and preconditions
  - when: action being tested
  - then: expected outcome
- Use comments to mark each section when helpful

## Build Tools
- Use Makefile if project has one
- Use Mage if project has magefile.go
- Common targets: build, test, lint, fmt

## Avoid
- Never add abstractions, patterns, or flexibility that isn't needed
- Never make unrelated changes or improvements outside the task
- Never add comments that restate the code
- Never add libraries without asking
- Never change formatting or style in code you're not modifying
- Never add error handling for scenarios that can't happen
- Never leave TODOs or FIXMEs without clear context
- Never delete code without understanding why it exists
- Never add backwards-compat layers when you can just change the code
- Never add `// TODO: implement` without actually implementing
- Never comment out code, delete it
