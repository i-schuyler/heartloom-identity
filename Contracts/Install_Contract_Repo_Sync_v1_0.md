# Install Contract: heartloom-identity Repo Sync (v1.0)

Status: **IMPLEMENTED OPT-IN CONTRACT (vault sync non-default; authority transition completed)**  
Type: Installer contract for repo-root `install.sh`  
Target: `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`

## Purpose

Define explicit behavior for repo-root `install.sh` when vault sync is explicitly requested via `--vault-sync`.

Default installer posture is no repo-to-vault sync unless the operator opts in.

Phase 1 included a short-lived technical compatibility alias path for legacy consumers; active installer alias sync was retired in the partial alias-retirement slice.

This document is normative for implementation and verification of installer behavior.

## Current state

- **Current (implemented):** Repo-root `install.sh` applies this contract to copy/sync docs into vault target only when `--vault-sync` is provided.
- **Current default:** `./install.sh` performs no vault sync and prints guidance.
- **Current authority state:** Repo-canonical authoring transition is completed and recorded in Change-Control.

## Contract scope

### Source roots (repo)

Only these source roots are in install scope:

- `./*.md` (repo-root markdown documents)
- `./Policies/AI/*.md`

### Destination roots (vault)

- `./*.md` in repo maps to `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/*.md`
- `./Policies/AI/*.md` maps to `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/Policies/AI/*.md`

### Path mapping rule

- Mapping is path-preserving within those roots.
- Canonical sync writes are constrained to `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`.
- No file may be installed outside those bounded roots.

## Install semantics

### Explicit opt-in requirement

- Vault sync behavior is non-default and requires `--vault-sync`.
- This preserves GitHub repo canonical authority while keeping vault sync available as an operator-selected path.

### Mode definition

- Contract mode is **sync-copy (upsert) without prune**.
- Meaning:
  - Files in scope that exist in repo are copied/updated into destination.
  - Files in destination that are not present in repo are **not deleted** by default.

### Overwrite/update posture

- If destination file exists and differs from source, destination is overwritten by source.
- If destination file exists and matches source, no content change is performed.
- If destination file is missing, it is created.

### Missing destination paths

- Installer must create required destination directories when absent.
- Creation is limited to paths under `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`.

### Legacy alias retirement posture

- Installer legacy alias sync path is retired.
- `install.sh` no longer exposes `--legacy-alias` or `--no-legacy-alias` options.
- Legacy path references remain change-control/history-only in this repo until a later cleanup slice.

## Exclusions

Excluded from install scope:

- `.git/` and all git metadata.
- Dotfiles (any path segment beginning with `.`), including `.gitignore`.
- Non-markdown files outside explicit future contract revisions.
- Any future implementation scripts (including `install.sh`) and operational tooling files.

## Behavior for vault-only files (absent in repo)

- Default behavior: retain vault-only files untouched (no delete/prune).
- If a prune mode is introduced later, it must be explicit (for example `--prune`) and must require additional safety controls documented in a new contract revision.

## Dotfile behavior

- Dotfiles are never copied to vault by this contract.
- Dotfiles already present in vault are left unchanged.

## Dry-run behavior (implemented)

- Installer supports `--dry-run` (and `-n`) and prints planned creates/updates/skips with no filesystem writes.
- For vault sync preview, use `./install.sh --vault-sync --dry-run`.

## Rollback and safety posture

- Safety-first posture: default contract avoids destructive deletes.
- Before any future destructive mode is allowed, implementation must define:
  - pre-change snapshot/manifest behavior,
  - explicit operator confirmation path,
  - bounded rollback procedure.
- Those destructive semantics are out of scope for this version.

## Session-pack interaction constraints

- This contract does not change current session-pack regeneration implementation.
- A later implementation slice must define how installer execution and session-pack regeneration sequence together without guessing.

## Authority transition gate reference

- Installer implementation alone does not complete authority transition without validation evidence.
- Transition readiness is governed by:
  - `Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md`

## Explicit non-goals (implementation boundary)

- No additional authority-state changes triggered by installer execution alone.
- No additional vault path changes beyond canonical `Heartloom-Identity`.
- No session-pack regeneration implementation.
- No CI/release changes.

Contracts/Install_Contract_Repo_Sync_v1_0.md EOF
