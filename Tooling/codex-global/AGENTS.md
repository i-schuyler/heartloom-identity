# AGENTS.md

## Global Codex defaults

- Prefer PR-first workflow.
- Include branch checkout commands in suggested workflows.
- After successful slice work, include push commands and `gh pr create`.
- After merge, include both remote and local cleanup commands.
- Clipboard payload must match the prompt-defined output contract exactly.

## Safe stale-branch guidance

- Start with `git fetch --prune origin`.
- Delete only fully merged local branches that are not the current branch.
- Never assume it is safe to delete unmerged branches or the current branch.
