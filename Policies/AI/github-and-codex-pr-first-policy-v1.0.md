# GitHub and Codex PR-First Policy (v1.0)

## Purpose

This policy defines the PR-first workflow used from a phone/Termux environment, and the boundary between ChatGPT planning and Codex implementation.

## Scope and specialization rule

- This policy is the **cross-project default** for PR-first collaboration.
- Project-local canonical docs may specialize execution behavior.
- When a repo-local `AGENTS.md` defines a stricter workflow (for example Codex-prompt-only, no manual command blocks, mandatory preflight sequencing), follow that repo-local rule.

## Evidence Block

- `heartloom-identity/AGENTS.md` defines a Codex-prompt-only flow with no manual branch/push/PR command blocks in assistant prompts.
- `heartloom-identity/AGENTS.md` requires PR preflight first, safe stale-branch cleanup, and auto-merge attempt sequencing.
- Clipboard payload requirements remain governed by prompt-defined output contracts.

## Boundary: ChatGPT vs Codex

- ChatGPT: planning/specs/docs/architecture decisions/repo scaffolding/risk reviews.
- Codex CLI: implementation inside the repo (small diffs, tests/builds, refactors, mechanical edits, CI-fix loops).
- Codex is treated as knowing only what exists in the repo or is explicitly included in the prompt.

## PR-first workflow (phone/Termux)

Default slice loop (Codex-first):

1. Assistant provides scope, Codex prompt payload, and recommended model/reasoning level.
2. Codex run performs PR preflight first (open relevant PR checks, CI/mergeability review, merge if green+mergeable, hard-stop/report if red).
3. Codex run performs safe stale-branch cleanup (local-only; fully merged non-current branches only).
4. Codex run performs slice work (branch/create-switch, edits, commit, push, PR creation).
5. Codex run attempts auto-merge for the created PR when supported; if auto-merge cannot be enabled, verify/report exact reason after CI status check.
6. Assistant returns the required output contract; clipboard payload must match the prompt-defined contract exactly.
7. Repeat.

### Manual-command fallback (not default)

- Manual command blocks are fallback-only and should be used only when:
  - the project does not define a stricter Codex-prompt-only workflow, or
  - the user explicitly asks for manual command output.
- If fallback is used, keep command blocks minimal and aligned with this policy.

### Clipboard-return rule (required)

- Applies to every default slice loop unless a higher-authority document explicitly overrides it.
- The returned summary should be verbatim to preserve implementation context and reduce re-entry drift.
- This policy does not require any specific clipboard utility; fallback behavior is required when clipboard integration is unavailable.
- If the user prompt defines a required output contract (for example numbered sections), the clipboard payload must match that contract exactly rather than a generic execution summary.
- Numbered clipboard contracts are not capped at 5; include however many numbered sections are generated for that slice (for example 1–6 when six sections are required).
- Clipboard verification step: confirm the copied block begins with the expected first contract heading before ending the slice.

### Docs Review Gate (required before risky DEV)

Before implementing multi-file changes or anything that touches security boundaries, schema/data integrity, device state, OTA, logs, or firmware behavior:

- The Assistant must propose a **docs-only** PR (or docs-only changes) to anchor the spec.
- The Assistant must provide reproducible review-bundle generation instructions.
- In Codex-prompt-only repos, Codex may execute the generation step directly and report the staged output path/results instead of emitting manual command blocks.

Staging path:

`/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`

- The user uploads the zip for review.
- Only after review/approval should implementation slices proceed.

## `gh pr create` fallback (`gh api` only if gh PR create fails)

Only if user reports that `gh pr create` fails due to git exec/permission issues in Termux:

- Create PRs via `gh api`.
- Before POST, verify access with: `gh api -X GET "repos/$OWNER_REPO"`.

Normalization:

- Normalize `OWNER_REPO` to `owner/repo` by stripping custom SSH host aliases.

## CI truth on phone

- PlatformIO `pio` is not installed on phone/Termux.
- CI compile-check is the authoritative build verification from phone contexts.
- Codex prompts must not request local `pio run` on the phone.

## CI fix loop

If CI fails:

- Patch the same PR branch with a small targeted commit and push to rerun CI.
- Do not open a new PR for the same change set.

## Diff reality check before push/PR

Before pushing or opening a PR, confirm committed changes using:

- `git log main..HEAD`
- `git diff --stat main..HEAD`

## Default Git conventions

- Default branch: `main`
- Branch naming: `feat/<short-kebab>`, `fix/<short-kebab>`, `docs/<short-kebab>`, `chore/<short-kebab>`
- Commit messages: imperative present tense (optionally `feat:`, `fix:`, `docs:`, `chore:`)
