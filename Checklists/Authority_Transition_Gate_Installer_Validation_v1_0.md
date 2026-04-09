# Authority Transition Gate: Installer Validation (v1.0)

Status: **GATE SATISFIED (validation complete; authority transition approved)**  
Type: Validation and transition-approval checklist  
Scope: Conditions required before practical authority transition from vault-first workflow to repo-canonical `Heartloom Identity`

## Purpose

Define exact validation and approval criteria required to declare authority transition completion, and record gate outcomes.

This document now includes a completed validation outcome record for transition approval.

## State model (must remain explicit)

- **Authority model:** Repo-canonical `Heartloom Identity` authority is now recorded as complete in Change-Control.
- **Implemented component:** `install.sh` exists and implements sync-copy upsert without prune.
- **Transition state:** authority transition is **READY / COMPLETED** for current validated state.

## Validation outcome record (current)

Date recorded: `2026-04-07`  
Outcome: **READY satisfied; authority transition complete**

Evidence used:

- Live install succeeded against `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`.
- Post-install `git status` remained clean.
- Installed vault tree showed expected in-scope files present.
- Spot checks confirmed key files at expected destination paths.
- Real-environment dry-run output:
  - `scanned=27`
  - `created=0`
  - `updated=0`
  - `skipped=27`
  - `mode=sync-copy-upsert-without-prune`
  - `no-deletes-performed=true`

Still pending (explicit):

- Session-pack regeneration automation is not implemented in this slice.
- Bundle/release distribution model remains a separate future concern.

## Preconditions for transition validation

All must be true before validation begins:

- Install contract is the current implemented contract document:
  - `Contracts/Install_Contract_Repo_Sync_v1_0.md`
- Authority change-control document is current and records transition completion:
  - `Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md`
- Canonical vault target remains unchanged and accessible:
  - `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`
- Validation run context records commit SHA of installer being validated.
- Operator has a rollback plan prepared before live install validation (see rollback section).

## Dry-run validation requirements

Dry-run is mandatory before live install.

### Required checks

- Run `./install.sh --dry-run` from repo root.
- Output must report non-prune posture (`mode=sync-copy-upsert-without-prune`).
- Output must report no delete operations (`no-deletes-performed=true`).
- Output must show only create/update/skip actions for in-scope markdown paths.

### Scope/file-count validation method

Do not hardcode a fixed count in policy. Validate by method:

- Compute expected scope count from current repo content using contract rules:
  - repo-root markdown files only (`./*.md`, excluding dotfiles)
  - `Policies/AI/*.md` only (excluding dotfiles)
- Compare computed expected count to installer-reported `scanned=` count.
- Any mismatch is **NOT READY** until investigated and resolved.

### Exclusion validation

Dry-run output must not include:

- dotfiles,
- `.git/` paths,
- non-markdown files,
- tooling scripts (including `install.sh`).

## Live install validation requirements

Live install validation is required after dry-run passes.

### Required checks

- Run `./install.sh` at least once against canonical vault target.
- Installer may create missing destination directories under canonical target only.
- Installer must not delete vault-only files.
- Resulting output must contain only create/update/skip actions.

### Post-run checks

- Confirm destination root exists and expected policy subfolder exists.
- Confirm at least one known changed file from repo is reflected in vault copy.
- Confirm at least one known unchanged file remains byte-identical (skip behavior).

## Spot-check validation expectations

Spot-checks are required for both source roots.

- Root scope: verify selected repo-root markdown files land at vault root with same relative names.
- Policy scope: verify selected `Policies/AI/*.md` files land in matching vault subpath.
- Use representative changed and unchanged files where available.
- Record checked filenames and outcomes in transition notes.

## Rollback posture requirements

Before live validation, rollback readiness must be documented.

- Capture a pre-install snapshot/manifest of vault target state using current operator-approved method.
- Record snapshot location and restore procedure in validation notes.
- If rollback artifacts are missing or unverified, transition remains **NOT READY**.

## Session-pack and regeneration awareness requirements

Authority transition cannot be marked complete without session-pack awareness closure.

- Acknowledge installer execution does not by itself regenerate session packs.
- Validate that current session-pack process remains coherent with installed vault state.
- If sequencing between installer runs and session-pack regeneration is not yet proven, mark **NOT READY** and require a follow-up verification slice.

## READY vs NOT READY decision rule

### Mark as NOT READY when any of these are true

- Any precondition is unmet.
- Dry-run checks fail or scope-count method does not reconcile.
- Exclusion boundaries are violated.
- Live install produces behavior outside create/update/skip.
- Rollback readiness is undocumented or unverified.
- Session-pack sequencing awareness remains unresolved.
- No explicit human approval record exists.

### Mark as READY only when all are true

- All preconditions and dry-run checks pass.
- Live install validation and spot-checks pass.
- Rollback readiness is documented and testable.
- Session-pack awareness checks are completed or explicitly accepted with bounded follow-up.
- A dated human approval note is recorded in change-control documentation.

## Approval recording requirement

When READY is reached, record a dated decision entry that includes:

- commit SHA validated,
- validation artifacts/notes location,
- approver identity,
- declared transition status.

Without this decision record, transition remains **NOT READY**.

Current decision record:

- commit SHA validated: evidence block supplied for current transition-completion slice
- validation artifacts/notes location: this gate doc and linked change-control record
- approver identity: repository owner/operator via supplied validated evidence block
- declared transition status: READY / COMPLETED

Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md EOF
