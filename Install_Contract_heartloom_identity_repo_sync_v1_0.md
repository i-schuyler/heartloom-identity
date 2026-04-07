# Install Contract: heartloom-identity Repo Sync (v1.0)

Status: **IMPLEMENTED CONTRACT (installer available; authority transition completed)**  
Type: Installer contract for repo-root `install.sh`  
Target: `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`

## Purpose

Define explicit behavior for repo-root `install.sh` that installs canonical `00_Identity` docs from this repository into the vault target path.

This document is normative for implementation and verification of installer behavior.

## Current state

- **Current (implemented):** Repo-root `install.sh` applies this contract to copy/sync docs into vault target.
- **Current authority state:** Repo-canonical authoring transition is completed and recorded in Change-Control.

## Contract scope

### Source roots (repo)

Only these source roots are in install scope:

- `./*.md` (repo-root markdown documents)
- `./Heartloom-AI-Policies/*.md`

### Destination roots (vault)

- `./*.md` in repo maps to `/storage/emulated/0/Documents/HeartloomVault/00_Identity/*.md`
- `./Heartloom-AI-Policies/*.md` maps to `/storage/emulated/0/Documents/HeartloomVault/00_Identity/Heartloom-AI-Policies/*.md`

### Path mapping rule

- Mapping is path-preserving within those roots.
- No file may be installed outside `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`.

## Install semantics

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
- Creation is limited to paths under `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`.

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
  - `Authority_Transition_Gate_Installer_Validation_v1_0.md`

## Explicit non-goals (implementation boundary)

- No additional authority-state changes triggered by installer execution alone.
- No vault path changes.
- No session-pack regeneration implementation.
- No CI/release changes.

Install_Contract_heartloom_identity_repo_sync_v1_0.md EOF
