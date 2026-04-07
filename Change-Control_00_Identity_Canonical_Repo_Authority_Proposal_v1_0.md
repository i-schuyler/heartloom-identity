# Change-Control: 00_Identity Canonical Repo Authority Proposal (v1.0)

Status: **PROPOSED (docs-only; not implemented)**  
Type: Change-Control / authority model proposal  
Scope: `00_Identity` documentation authority and install flow boundaries

## Purpose

Document the proposed authority model where this dedicated GitHub repository becomes the canonical authoring source for `00_Identity` **after** a later implementation slice is completed.

This document does **not** implement installer behavior, runtime changes, path changes, or authority flips.

## Current state (implemented today)

- This repo is a Git-tracked imported copy of `00_Identity` content (repo root and `Heartloom-AI-Policies/`).
- The currently installed/consumed local copy remains in HeartloomVault at:
  - `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`
- Current canon for in-vault operation and session packs remains the Android vault path/workflow.
- No installer script in this repo currently owns synchronization into the vault.

## Proposed future state (after implementation, not active yet)

- This repository becomes the canonical working authoring source for `00_Identity`.
- The HeartloomVault path remains the install/consumption target, populated from this repo.
- A repo-root installer script (future slice) copies/syncs canonical docs from this repo into:
  - `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`
- Session artifacts are regenerated from the implemented canonical flow once that implementation is complete and accepted.

## Authority ladder impact

### During transition (current)

- No authority flip is performed by this docs-only slice.
- Existing vault/session-pack canon remains authoritative.

### After approved implementation (future)

- Canonical authoring authority for `00_Identity` shifts to this GitHub repo.
- Vault `00_Identity` becomes the installed/consumed downstream copy.
- Any conflicts are resolved by implementation-phase authority docs and installer contract.

## Installer role (future, not implemented here)

Planned installer responsibilities:

- Copy/sync canonical docs from repo root into vault install target.
- Preserve required vault path compatibility.
- Provide explicit sync semantics and failure handling (defined in later implementation slice).

## Vault install target

- Unchanged target path:
  - `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`

## Canon boundaries: in-repo vs in-vault

- **Now (implemented):** vault copy remains operationally authoritative for installed consumption.
- **Future (proposed):** repo copy becomes canonical authoring source; vault copy is installer-managed output.

## Session-pack regeneration implications

- This slice changes documentation only; no packaging scripts or runtime commands are modified.
- Until implementation is complete, continue current session-pack regeneration flow and staging conventions.
- A later implementation slice must define exact regeneration command updates for the repo-authoritative model.

## Transition constraints

- Keep proposal state explicit until implementation is complete.
- Do not silently reinterpret current canon.
- Do not change canonical Android vault root/path definitions.
- Do not modify installer/runtime tooling in this slice.

## Migration risks

- Silent dual-authority drift between repo and vault copies.
- Confusion between authoring source and installed copy during transition.
- Partial sync outcomes if installer contract is underspecified.
- Session-pack mismatch if regeneration source is changed before installer implementation.

## Explicit non-goals for this slice

- No installer implementation.
- No repo bootstrap scripts.
- No file moves/renames for implementation purposes.
- No `termux-utils` changes.
- No CI changes.
- No release automation changes.
- No vault path changes.
- No practical authority flip.

## Durable decision record (proposal state)

- Clipboard-return rule canonization is now documented in:
  - `Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`
- Policy discoverability is documented in:
  - `Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md`
- Repo authority split is recorded as proposed Change-Control in this document and remains non-implemented until a later approved implementation slice.

Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md EOF
