# Change Control: Heartloom Identity Rename (v1.0)

Status: **CANONICAL CHANGE-CONTROL DEFINED (implementation deferred)**  
Type: Rename/path compatibility and downstream change-control contract  
Scope: Canonical transition from legacy `00_Identity` naming to `Heartloom Identity` naming across docs, install/export contracts, and downstream references

## Purpose

Define the canonical rename and change-control boundaries for transitioning from `00_Identity` to `Heartloom Identity` **before implementation work begins**, so naming/path changes are explicit, compatible, and auditable.

## Scope (explicit)

This change-control defines:

- What is being renamed vs preserved.
- Canonical naming forms (display vs filesystem-safe path token).
- Canonical vault-path transition posture.
- Temporary compatibility alias posture for legacy `00_Identity` references.
- Downstream contracts/docs/scripts that must be updated in a follow-up implementation slice.
- Required verification for implementation completion.

## NOT in this slice (explicit)

- No file/folder/path renames in repo or vault.
- No installer behavior changes.
- No export script, manifest, or artifact-name changes.
- No policy/contract rewrites beyond defining this change-control.
- No session-pack tooling changes.

## Evidence Block

- Current install contract and installer implementation are explicitly anchored to `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`.
- Current export contract and export script are explicitly anchored to `00_Identity` naming (including artifact naming).
- Current repo canon records `00_Identity` as the installed/consumed downstream copy.
- Current policy/docs include broad hardcoded `00_Identity` references across root docs, policy docs, installer help text, and export metadata.
- Requested direction is to move toward GitHub-style naming conventions while preserving safe compatibility for existing downstream consumption.

## Canonical naming contract (defined)

### Name forms

- **Human-facing canonical name:** `Heartloom Identity`
- **Filesystem-safe canonical path token:** `Heartloom-Identity`
- **Legacy compatibility token:** `00_Identity`

### What is being renamed

- The canonical identity-layer label in docs/contracts from `00_Identity` to `Heartloom Identity`.
- The canonical vault install directory from legacy token to filesystem-safe canonical token (defined below).
- Export artifact naming and references that currently treat `00_Identity` as canonical naming.

### What is NOT being renamed

- GitHub repository slug `heartloom-identity`.
- Existing semantic/version suffix conventions (for example `_v1_0.md`) unless separately changed.
- Unrelated folder names outside this rename scope.

## Canonical path + compatibility contract

### Canonical vault path (target state)

- Future canonical install/consumption path is defined as:
  - `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`

### Legacy compatibility alias

- Legacy path remains a temporary compatibility alias during migration:
  - `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`
- Compatibility alias must remain supported for at least one explicit migration cycle after implementation.
- Legacy path must not be silently deleted or pruned during rename rollout.

### Compatibility posture

- Rename implementation must include an explicit transitional compatibility mode (for example alias/sync strategy) documented in install and export contracts.
- Decommissioning legacy `00_Identity` compatibility requires a later explicit change-control slice after downstream verification.

## Downstream update implications (follow-up required)

At minimum, a later implementation slice must update:

- `Install_Contract_heartloom_identity_repo_sync_v1_0.md` (or successor): destination roots and path mapping semantics.
- `install.sh`: destination path constant, help text, summary language, and any compatibility handling behavior.
- `Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md` (or successor): authority-language references to legacy naming.
- `ChatGPT_Project_00_Identity_Export_Contract_v1_0.md` (or successor): artifact naming, scope language, and path references.
- `scripts/export-chatgpt-00-identity-zip.sh` + `scripts/chatgpt-00-identity-export.manifest`: script naming/metadata and artifact filename references.
- `README.md`, `INDEX.md`, and policy docs under `Heartloom-AI-Policies/` that hardcode legacy `00_Identity` paths/names.
- Export-safe docs and existing provenance/readme outputs under `exports/` where legacy naming is represented as canonical.

## Implementation plan for the rename slice (later)

1. **Organize loose docs into folders (if approved in slice scope)**
   - Define final docs/folder layout decisions first; avoid mixing structural reorg and rename semantics without explicit mapping.
2. **Rename files/folders/path tokens**
   - Apply canonical naming (`Heartloom Identity` / `Heartloom-Identity`) where in-scope.
   - Introduce explicit compatibility handling for `00_Identity` references.
3. **Update links/references**
   - Refresh all internal links and hardcoded references across repo docs/policies/scripts.
4. **Update install/export/path contracts**
   - Revise install/export contracts and implementation docs in the same slice as behavior changes.
5. **Run link/path audit**
   - Validate no unresolved canonical references and no broken links/path assumptions remain.

## Required verification after implementation

- Installer verification:
  - `./install.sh --dry-run` reflects canonical `Heartloom-Identity` path semantics.
  - `./install.sh` applies expected behavior without destructive deletion.
- Export verification:
  - Export script produces canonical artifact naming and valid provenance metadata.
  - Export zip integrity check remains successful.
- Reference audit:
  - Repo-wide search confirms legacy `00_Identity` appears only in approved compatibility/deprecation contexts.
  - Internal links and documented paths resolve correctly.
- Canon consistency verification:
  - README/INDEX/contracts/policy references agree on canonical naming/path state.

## State transition map (planned)

- **Before:** `00_Identity` is both canonical label and canonical vault path token.
- **After implementation:** `Heartloom Identity` becomes canonical label; `Heartloom-Identity` becomes canonical vault path token; `00_Identity` remains temporary compatibility alias.
- **After later deprecation slice:** legacy compatibility alias may be retired only with explicit approval and verified downstream readiness.

## Hard Stop Conditions

- STOP if current canon for `00_Identity` naming/path authority is not clearly locatable.
- STOP if rename scope is ambiguous between repo-only and vault-wide behavior.
- STOP instead of implementing rename behavior in this slice.
- STOP if a red open workflow PR requires fixing before rename-planning progress.

Change_Control_Heartloom_Identity_Rename_v1_0.md EOF
