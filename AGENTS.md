# AGENTS.md

## Repository expectations

This repo uses a Codex-prompt-only workflow (no manual command blocks in assistant prompts).

### Required workflow shape
- Codex handles all git operations for the slice (branching, commit, push, PR, auto-merge attempt).
- Do not include manual branch checkout/push/PR/cleanup command blocks in assistant prompts for this repo.
- Include model selection and reasoning level in Codex prompts.
- Include explicit Scope and NOT in this slice sections.
- Include an Evidence Block whenever canon, contracts, authority, or workflow behavior is being changed.
- Include Hard Stop Conditions.
- Clipboard payload must match the prompt-defined output contract exactly.

### PR preflight (do first in future Codex runs)
- Check for open PRs Codex is responsible for in this repo (do not merge unrelated PRs).
- Inspect CI status and mergeability for relevant open PRs.
- If CI is green and PR is mergeable, merge it.
- If CI is red, STOP and report the failure with a fix recommendation.
- If CI is pending, report pending status; proceed only if appropriate.

### Safe startup cleanup (after PR preflight/merge handling)
- Run `git fetch --prune origin`.
- Delete only fully merged local branches that are not the current branch.
- Never delete the current branch or any unmerged branch by default.

### Required Codex run steps (this repo)
1. Perform PR preflight (see above).
2. Perform safe stale-branch cleanup (see above).
3. Create/switch to the next slice branch.
4. Do the slice work.
5. Commit.
6. Push.
7. Create the PR.
8. Attempt to enable auto-merge for the PR when supported.
9. If auto-merge cannot be enabled, verify CI status first:
   - If CI is red, STOP and report the failure with a fix recommendation.
   - If CI is green/clean, report the exact auto-merge failure reason (do not guess).

### Cleanup clarity
- Local branch cleanup remains local-only; do not delete remote branches directly.
- Remote branch deletion is handled by GitHub settings after merge when enabled.

### Operator note (environment-specific)
- In this environment, `/approvals` set to full access suppresses the y/n/esc edit-review prompt more effectively than repo config alone. This is not a universal Codex guarantee.

### Repo-specific boundaries
- Respect repo-canonical authority model and current docs.
- Do not assume release tooling, bundle tooling, or session-pack automation exists unless documented in repo canon.
- Do not broaden permissions beyond project config.
