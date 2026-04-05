## Behavior
- Follow direct user instructions first, then project/local instructions, then this global file, then default agent behavior
- When multiple instruction files apply, prefer the most specific/local instruction over broader guidance
- Ask before making significant changes (new files, cross-cutting refactors, architectural changes, or behavior changes outside the requested scope)
- Ask before creating new documentation files, or making substantial README/docs changes that are not directly required by the requested task
- Ask before adding new dependencies
- When uncertain about requirements or approach, ask clarifying questions before proceeding

## Scope Discipline
- IMPORTANT: Complete the requested task, nothing more
- Do not fix unrelated issues; report them instead
- Do not refactor beyond what is explicitly requested
- Prefer editing existing files over creating new ones
- When scope creep is tempting, ask first

## Output Style
- Be concise; lead with the action or answer, not the reasoning
- Do not summarize what you just did unless asked
- Explain only what is necessary for the user to understand or unblock
- When showing code changes, prefer diffs or minimal context over full file dumps

## Testing Workflow
- IMPORTANT: For bug fixes, follow a strict test-first workflow — do not skip steps 1 or 2 unless an automated reproducing test is genuinely impractical
- For new features, refactors, and other behavior changes, use test-first development when practical and prefer adding or updating tests before changing production code
- Do not treat docs-only, copy-only, formatting-only, or other non-behavioral changes as requiring test-first development

For bug fixes, required sequence:
1. Add or update an automated test that reproduces the bug.
2. Run the reproducing test and confirm it fails for the expected reason.
3. Implement the production fix.
4. Re-run the reproducing test, then run formatter, linter, tests, and any relevant build commands.

For new features, refactors, and other behavior changes, preferred sequence when practical:
1. Add or update tests that define the expected behavior.
2. Run the relevant tests before changing production code when practical.
3. Implement the production change.
4. Re-run formatter, linter, tests, and any relevant build commands.

- If test-first development is impractical, explicitly explain why and describe how the change will be verified instead
- In the final response, state whether tests were written first and run before the production change, or why that was impractical
- When speed and process conflict, prioritize correctness and this workflow over speed

## Verification
- IMPORTANT: Before reporting completion, verify that changes compile and pass all validation steps; do not report success based on assumption
- After code changes, run validation in order: formatter, linter, tests
- Prefer project entrypoints (`make`, `just`, scripts) over ad hoc commands
- When available, use the repo's task runners, scripts, linters, formatters, and test commands
- If any validation step is skipped, say why in the final response

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

## Code Principles
- Prefer library-provided utilities over custom implementations
- Prefer small, focused functions over large monolithic ones
- Prefer explicit over implicit behavior
- Prefer immutability where practical
- Prefer simple code over unnecessary abstractions
- Prefer changing code directly over adding backwards-compat layers
- Run formatters before finishing when feasible; do not manually format code
- Do not change formatting in code you are not modifying
- Prefer descriptive names over comments
- Avoid comments unless they add real value
- Prefer deleting dead code over commenting it out
- Do not leave TODOs or FIXMEs without clear context
- Do not add `// TODO: implement` without actually implementing
- Propagate errors with context rather than swallowing them
- Prefer returning errors over panicking/throwing
- Fail fast on programmer errors; handle gracefully on user/external errors
- Do not add defensive checks for conditions the type system already prevents
- When multiple approaches exist, ask which to follow
- If existing code uses suboptimal patterns, suggest improvements but ask before applying
- Do not delete code without understanding why it exists
- Fix root causes, not symptoms

## When Blocked
- IMPORTANT: Do not retry the same failing approach more than once; investigate or ask
- If a command fails or tests break unexpectedly, report what you tried and what failed before retrying
- If your change introduces new test failures, revert and investigate before trying a different approach
- If required tooling is missing or inaccessible, report it rather than working around it

## Questions & Decisions
- Use the question tool when available to present choices
- When asking questions, provide concrete options with a recommended choice marked "(Recommended)"
- Do not ask open-ended questions when choices can be enumerated
- Prefer selecting from options over requiring typed input

## Security & Secrets
- IMPORTANT: Never expose, print, or commit secrets, tokens, private keys, or credentials unless explicitly required and approved
- Treat `.env`, credential files, key material, and production config as sensitive
- Ask before changes that affect auth, permissions, billing, infrastructure, deployments, or production data
- If secrets appear in code, logs, or diffs, do not repeat them; warn the user and minimize exposure
