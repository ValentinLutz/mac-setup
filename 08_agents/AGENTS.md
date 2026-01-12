# Global Agent Instructions

## Behavior
- Ask before making significant changes
- Can suggest improvements, but ask before implementing them
- Ask before creating or modifying README and documentation files

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Types: feat, fix, docs, style, refactor, test, chore
- Keep commits focused and atomic
- Subject line only, no body

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
- Use given-when-then pattern with comments:
  ```
  // given: <setup description>
  // when: <action description>
  // then: <expected outcome>
  ```

## Build Tools
- Use Makefile if project has one
- Use Mage if project has magefile.go
- Common targets: build, test, lint, fmt
