# Codex Global Source + Install Contract: heartloom-identity (v1.0)

Status: **IMPLEMENTED CONTRACT (source files and installer mode available)**  
Type: Canonical source/target/install contract for global Codex runtime files  
Scope: Source location in this repo, target mapping to `~/.codex/`, install posture, bundle exclusion, and safe stale-branch guidance

## Purpose

Define how `heartloom-identity` acts as canonical source-of-truth for user-global Codex runtime files while keeping this contract distinct from vault install behavior and consumer bundle contents.

This document defines contract semantics and the implemented installer mode for explicit `~/.codex` installation.

## Implemented vs future state (required clarity)

- **Implemented now:** `heartloom-identity` is canonical for identity/policy docs and current vault installer behavior.
- **Implemented now:** global Codex source files live under `Tooling/codex-global/`.
- **Implemented now:** explicit installer mode installs global files into `~/.codex/`.

## Canonical source location inside this repo

Reserved source area for future global Codex runtime files:

- `Tooling/codex-global/`

Expected source files:

- `Tooling/codex-global/AGENTS.md`
- `Tooling/codex-global/config.toml`

This source area is intentionally separate from consumer-facing canon docs.

## Install target mapping under `~/.codex/`

Mapping:

- `Tooling/codex-global/AGENTS.md` -> `~/.codex/AGENTS.md`
- `Tooling/codex-global/config.toml` -> `~/.codex/config.toml`

If additional global files are added later, each must be explicitly documented with source->target mapping in a contract update slice.

## Install posture (explicit and optional)

- Installation into `~/.codex/` is **explicit/optional**, not implicit.
- Normal vault install flows continue working without touching `~/.codex/`.
- Global file installation is opt-in via explicit installer mode (manual command), never a hidden side-effect.

## Relationship to existing vault install behavior

- Current `./install.sh` default behavior remains vault-focused and unchanged.
- Vault sync semantics and authority behavior are unaffected.
- `~/.codex` install behavior is implemented only via explicit installer mode.

## Relationship to repo-local `AGENTS.md` files

- Global `~/.codex/AGENTS.md` provides broad default guidance.
- Repo-local `AGENTS.md` files (for example in active project repos) provide more specific, in-scope overrides.
- This contract keeps both layers explicit: global defaults plus repo-scoped specificity.

## Consumer bundle exclusion posture

Global Codex runtime source files are excluded from consumer bundles by default:

- Exclude `Tooling/codex-global/` from bundle candidates unless a future canonical slice explicitly includes a justified subset.
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

## Non-goals

- No authority changes.
- No bundle tooling changes.
- No CI changes.
- No session-pack automation.
- No repo restructuring beyond docs.

Contracts/Codex_Global_Source_Install_Contract_v1_0.md EOF
