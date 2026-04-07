# Codex Global Source + Install Contract: heartloom-identity (v1.0)

Status: **CONTRACT DEFINED (implementation not yet completed)**  
Type: Canonical source/target/install contract for global Codex runtime files  
Scope: Source location in this repo, target mapping to `~/.codex/`, install posture, bundle exclusion, and safe stale-branch guidance

## Purpose

Define how `heartloom-identity` acts as canonical source-of-truth for user-global Codex runtime files while keeping this contract distinct from vault install behavior and consumer bundle contents.

This document defines contract semantics only. It does **not** create global files, change installer code, or enable automatic `~/.codex` installation.

## Implemented vs future state (required clarity)

- **Implemented now:** `heartloom-identity` is canonical for identity/policy docs and current vault installer behavior.
- **Implemented now:** installer behavior targets vault sync and does not define `~/.codex` mapping.
- **Defined now for future use:** source path, target mapping, and explicit install posture for global Codex files.
- **Not implemented yet:** actual global source files and install mechanism for `~/.codex/`.

## Canonical source location inside this repo

Reserved source area for future global Codex runtime files:

- `tooling/codex-global/`

Expected source files (when implemented in later slices):

- `tooling/codex-global/AGENTS.md`
- `tooling/codex-global/config.toml`

This source area is intentionally separate from consumer-facing canon docs.

## Install target mapping under `~/.codex/`

When implemented, mapping should be:

- `tooling/codex-global/AGENTS.md` -> `~/.codex/AGENTS.md`
- `tooling/codex-global/config.toml` -> `~/.codex/config.toml`

If additional global files are added later, each must be explicitly documented with source->target mapping in a contract update slice.

## Install posture (explicit and optional)

- Installation into `~/.codex/` is **explicit/optional**, not implicit.
- Normal vault install flows should continue working without touching `~/.codex/`.
- Any future install path for global Codex files must be clearly opt-in (manual command or explicit installer mode), never hidden side-effect.

## Relationship to existing vault install behavior

- Current `./install.sh` behavior remains vault-focused and unchanged by this contract.
- Vault sync semantics and authority behavior are unaffected.
- `~/.codex` install behavior is a separate future implementation concern.

## Relationship to repo-local `AGENTS.md` files

- Global `~/.codex/AGENTS.md` provides broad default guidance.
- Repo-local `AGENTS.md` files (for example in active project repos) provide more specific, in-scope overrides.
- This contract keeps both layers explicit: global defaults plus repo-scoped specificity.

## Consumer bundle exclusion posture

Global Codex runtime source files are excluded from consumer bundles by default:

- Exclude `tooling/codex-global/` from bundle candidates unless a future canonical slice explicitly includes a justified subset.
- Treat Codex-global runtime files as operator/tooling artifacts, not downstream consumer canon by default.

This preserves a clear boundary between consumer-facing identity docs and maintainer/operator runtime tooling.

## Safe stale-branch workflow guidance for global `AGENTS.md` updates

When future slices update the global `AGENTS.md` source, use conservative branch cleanup:

1. Refresh and prune stale remote tracking refs:
   - `git fetch --prune origin`
2. Confirm current branch and merge state before cleanup:
   - `git branch --show-current`
   - `git branch --merged`
3. Delete only fully merged local branches:
   - `git branch -d <merged-branch>`

Safety rules:

- Never delete the current checked-out branch.
- Never assume unmerged branches are safe to delete.
- Avoid force-deleting (`git branch -D`) unless explicitly reviewed and intentional.

## Non-goals in this slice

- No `install.sh` code changes.
- No creation of actual global source files yet.
- No authority changes.
- No bundle tooling changes.
- No CI changes.
- No session-pack automation.
- No repo restructuring beyond docs.

Codex_Global_Source_Install_Contract_heartloom_identity_v1_0.md EOF
