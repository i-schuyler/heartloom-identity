# Change-Control: 00_Identity Canonical Repo Authority Proposal (v1.0)

Status: **AUTHORITY TRANSITION COMPLETED (installer validated; repo-canonical active)**  
Type: Change-Control / authority transition record  
Scope: `00_Identity` documentation authority and install flow boundaries

## Purpose

Record the authority transition outcome where this dedicated GitHub repository is now the canonical authoring source for `00_Identity`.

This document now records a completed transition decision based on validated installer evidence and transition-gate satisfaction.

Filename is retained for continuity with prior slices and references.

## Current state (implemented today)

- This repo is the canonical authoring source for `00_Identity` content (repo root and `Heartloom-AI-Policies/`).
- The currently installed/consumed local copy remains in HeartloomVault at:
  - `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`
- Vault copy is the installer-managed installed/consumed downstream copy.
- Installer script exists at repo root (`install.sh`) and applies the documented sync-copy upsert contract into the vault target.

## Transition completion evidence (validated)

- Live install succeeded against `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`.
- Post-install `git status` remained clean.
- Installed vault tree contained expected in-scope files.
- Spot checks confirmed key files at expected destination paths.
- Real-environment dry-run reported:
  - `scanned=27`
  - `created=0`
  - `updated=0`
  - `skipped=27`
  - `mode=sync-copy-upsert-without-prune`
  - `no-deletes-performed=true`

## Authority ladder impact

### Current authority state

- Canonical authoring authority for `00_Identity` is now this GitHub repo.
- Vault `00_Identity` is the installed/consumed downstream copy.
- Transition validation gate document records READY satisfaction and completion evidence:
  - `Authority_Transition_Gate_Installer_Validation_v1_0.md`

### Ongoing guardrail

- Any future authority-state change must be documented via Change-Control and gate revalidation.

## Installer role (implemented; authority transition complete)

Installer responsibilities:

- Copy/sync canonical docs from repo root into vault install target.
- Preserve required vault path compatibility.
- Provide explicit sync semantics and non-prune safety behavior per install contract.

Installer behavior contract reference:

- `Install_Contract_heartloom_identity_repo_sync_v1_0.md`

## Vault install target

- Unchanged target path:
  - `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`

## Canon boundaries: in-repo vs in-vault

- **Now (implemented):** repo copy is canonical authoring source.
- **Now (implemented):** vault copy is installer-managed installed/consumed output.
- Cross-repo consumer integration and local override governance is defined in:
  - `Consumer_Integration_Model_heartloom_identity_v1_0.md`

## Session-pack regeneration implications

- Installer implementation exists; this does not change session-pack regeneration implementation by itself.
- Session-pack regeneration automation remains unimplemented and still requires a dedicated later slice.
- Continue current session-pack regeneration flow and staging conventions until that automation/sequence slice is completed.

## Transition constraints

- Keep completed authority state explicit and avoid silent drift.
- Do not change canonical Android vault root/path definitions.
- Do not imply unrelated automation completion.

## Migration risks

- Silent dual-authority drift between repo and vault copies.
- Confusion between authoring source and installed copy during transition.
- Partial sync outcomes if installer contract is underspecified.
- Session-pack mismatch if regeneration source is changed before installer implementation.

## Explicit non-goals for this slice

- No repo bootstrap scripts.
- No file moves/renames for implementation purposes.
- No `termux-utils` changes.
- No CI changes.
- No release automation changes.
- No vault path changes.
- No session-pack regeneration automation implementation.

## Durable decision record (completion state)

- Clipboard-return rule canonization is now documented in:
  - `Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`
- Policy discoverability is documented in:
  - `Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md`
- Authority transition gate satisfaction and evidence record is documented in:
  - `Authority_Transition_Gate_Installer_Validation_v1_0.md`
- Repo-canonical authority transition is now recorded as complete in this document.

Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md EOF
