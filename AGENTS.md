# AGENTS.md

## Repository expectations

This repo uses PR-first workflow.

### Required workflow shape
- Include branch checkout/preflight commands before any edit slice.
- Include model selection and reasoning level in Codex prompts.
- Include explicit Scope and NOT in this slice sections.
- Include an Evidence Block whenever canon, contracts, authority, or workflow behavior is being changed.
- Include Hard Stop Conditions.
- Clipboard payload must match the prompt-defined output contract exactly.

### After successful slice work
Include:
- push commands
- `gh pr create` commands
- post-merge cleanup commands

### Post-merge cleanup
Prefer:
- `git switch main`
- `git pull --ff-only`
- `git branch -d <branch>`
- `git remote prune origin`
- `git status`

### Repo-specific boundaries
- Respect repo-canonical authority model and current docs.
- Do not assume release tooling, bundle tooling, or session-pack automation exists unless documented in repo canon.
- Do not broaden permissions beyond project config.
