# Change Control: Heartloom Identity Rename (v1.0)

Status: **CANONICAL CHANGE-CONTROL ACTIVE (phase 1 + partial alias retirement + final residual cleanup implemented)**  
Type: Rename/path compatibility and downstream change-control contract  
Scope: Canonical transition from legacy alias naming to `Heartloom Identity` naming across docs, install/export contracts, and downstream references

## Purpose

Define the canonical rename and change-control boundaries for transitioning from legacy alias naming to `Heartloom Identity`, so naming/path changes remain explicit, compatible, and auditable across implementation phases.

## Scope (explicit)

This change-control defines:

- What is being renamed vs preserved.
- Canonical naming forms (display vs filesystem-safe path token).
- Canonical vault-path transition posture.
- Temporary compatibility alias posture for legacy references.
- Downstream contracts/docs/scripts updated across implementation slices.
- Required verification for implementation completion.

## NOT in phase 1 (explicit)

- No full retirement of legacy compatibility alias.
- No downstream-repo implementation changes.
- No session-pack tooling redesign.
- No broad repository information-architecture reclassification.

## Evidence Block

- Canonical display naming is now `Heartloom Identity` across user-facing docs/contracts.
- Canonical vault/install path token is now `Heartloom-Identity`.
- Export contract/script/manifest naming now uses `Heartloom Identity` / `Heartloom-Identity` conventions.
- Active installer/export legacy compatibility bridges are retired; residual legacy-token usage is intentionally minimized.

## Canonical naming contract (defined)

### Name forms

- **Human-facing canonical name:** `Heartloom Identity`
- **Filesystem-safe canonical path token:** `Heartloom-Identity`
- **Legacy compatibility token:** `00_Identity`

### What is being renamed

- The canonical identity-layer label in docs/contracts from the legacy alias token to `Heartloom Identity`.
- The canonical vault install directory from legacy token to filesystem-safe canonical token (defined below).
- Export artifact naming and references that previously treated the legacy alias token as canonical naming.

### What is NOT being renamed

- GitHub repository slug `heartloom-identity`.
- Existing semantic/version suffix conventions (for example `_v1_0.md`) unless separately changed.
- Unrelated folder names outside this rename scope.

## Canonical path + compatibility contract

### Canonical vault path (target state)

- Future canonical install/consumption path is defined as:
  - `/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/`

### Legacy compatibility alias

- Legacy alias path was used as a temporary compatibility alias during migration.
- Compatibility alias support remained for one explicit migration cycle after implementation and was then retired from active installer/export behavior.
- Legacy path must not be silently deleted or pruned during rename rollout.

### Compatibility posture

- Rename implementation included an explicit transitional compatibility mode in installer/export behavior for phase 1.
- Decommissioning legacy installer/export compatibility is now implemented; remaining references are limited to historical/change-control and external-compatibility contexts.

## Downstream update implications (phase 1 status + follow-up)

Phase 1 implemented these updates:

- install destination semantics and docs now point to canonical `Heartloom-Identity` path.
- export contract/script/manifest naming now uses `Heartloom Identity` / `Heartloom-Identity` conventions.
- core canonical navigation and references were updated away from legacy visible naming.

Final cleanup slice outcome:

- Residual legacy-token references were removed from routine status/navigation/maintenance surfaces.
- External temporary compatibility note residue was removed from repo-local required-reference and trigger surfaces.
- Minimal historical record is intentionally concentrated in this change-control document.

## Implementation plan for follow-up slices

1. **Organize loose docs into folders (if approved in slice scope)**
   - Define final docs/folder layout decisions first; avoid mixing structural reorg and rename semantics without explicit mapping.
2. **Rename files/folders/path tokens**
   - Apply canonical naming (`Heartloom Identity` / `Heartloom-Identity`) where in-scope.
   - Introduce explicit compatibility handling for legacy alias references.
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
  - Repo-wide search confirms the legacy alias token appears only in approved compatibility/deprecation contexts.
  - Internal links and documented paths resolve correctly.
- Canon consistency verification:
  - README/INDEX/contracts/policy references agree on canonical naming/path state.

## State transition map

- **Before:** the legacy alias token `00_Identity` was canonical label and canonical vault path token.
- **After phase 1:** `Heartloom Identity` is canonical label; `Heartloom-Identity` is canonical vault path token; the legacy alias token remains temporary compatibility alias.
- **After partial alias retirement:** active installer/export legacy compatibility behavior is retired.
- **After final cleanup slice (current):** residual legacy-token references are removed from routine surfaces; minimal historical footprint remains in this record.

## Hard Stop Conditions

- STOP if current canon for legacy alias naming/path authority is not clearly locatable.
- STOP if rename scope is ambiguous between repo-only and vault-wide behavior.
- STOP instead of implementing rename behavior beyond approved phase scope.
- STOP if a red open workflow PR requires fixing before rename-planning progress.

Change_Control/Change_Control_Rename_v1_0.md EOF
