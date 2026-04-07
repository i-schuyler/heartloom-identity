# ChatGPT Project 00_Identity Export Contract (v1.0)

Status: **CANONICAL EXPORT CONTRACT DEFINED (export flow implemented; bundle publishing remains future)**  
Type: Downstream export artifact contract (ChatGPT-project Reference Pack)  
Scope: Defines the exported `00_Identity` Reference Pack zip artifact used by the ChatGPT project

## Purpose

Define a canonical, repeatable export contract for the ChatGPT-project `00_Identity` Reference Pack zip artifact, sourced from this repo’s canonical `00_Identity` docs.

This contract defines **what is exported** and **how it is refreshed**, without changing bundle publishing, installer semantics, or repo authority.

## Scope (explicit)

This contract covers:

- The purpose and contents of the ChatGPT-project `00_Identity` zip artifact.
- Source-of-truth expectations (repo-canonical source).
- Inclusion/exclusion boundaries for the export.
- Naming, version/date posture, and staging location.
- Provenance expectations and refresh workflow.
- Relationship to installed vault copies and future bundle publishing.

## NOT in this slice (explicit)

- No authority changes.
- No bundle publishing implementation.
- No consumer-repo changes (including termux-utils).
- No CI changes or release automation beyond this single export flow.
- No session-pack redesign beyond this explicit exported-zip contract.
- No changes to repo-local `.codex/config.toml` behavior.

## Evidence Block

- `heartloom-identity` is now the canonical authoring source for `00_Identity`.
- The ChatGPT project currently uses a posted `00_Identity` zip artifact that is stale relative to repo state.
- The repo already distinguishes canonical source, installed copies, bundle semantics, and consumer integration.
- The next downstream order is:
  1) refresh the ChatGPT-project identity zip artifact
  2) adopt termux-utils as the first official downstream repo consumer

## Source of truth and authority

- **Source of truth:** repo-canonical `heartloom-identity` content (this repo).
- **Installed copy (downstream):** vault `00_Identity` installed via `./install.sh`.
- **Exported ChatGPT artifact:** a downstream, read-only Reference Pack zip produced from repo-canonical state.
- **Future bundles/releases:** separate future distribution model, not implied by this export.

## Exported artifact purpose

The ChatGPT-project `00_Identity` zip is a **Reference Pack** downstream artifact for ChatGPT project use. It provides a stable snapshot of consumer-facing canonical docs without including maintainership-only or installer-internal materials.

## Export contents (explicit include list)

The ChatGPT Reference Pack includes only the docs listed in the export manifest and export-safe navigation.

Included files (explicit):

### A) Export-safe navigation

- `exports/chatgpt-reference-pack/README.md`
- `exports/chatgpt-reference-pack/INDEX.md`
- `ChatGPT_Reference_Pack_Manifest.md` (generated at export time and included at zip root)

### B) Consumer + bundle semantics

- `Consumer_Integration_Model_heartloom_identity_v1_0.md`
- `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md`
- `Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md`
- `First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md`

### C) Heartloom AI policy canon (selected)

- `Heartloom-AI-Policies/heartloom-ai-operating-protocol-v1.0.md`
- `Heartloom-AI-Policies/termux-and-shell-policy-v1.0.md`
- `Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`
- `Heartloom-AI-Policies/repo-standards-baseline-v1.0.md`
- `Heartloom-AI-Policies/zip-inspection-and-artifact-contract-v1.0.md`
- `Heartloom-AI-Policies/global-memories-refactored-set-v2.0.md`
- `Heartloom-AI-Policies/authority-boundary-map-v1.0.md`

### D) Core identity docs commonly used as downstream authority references

- `Heartloom_AI_Memory_Constitution.md`
- `Definitions_Glossary_v1_0.md`
- `github-governance-policy.md`
- `github-repo-intake-checklist.md`

If the ChatGPT project requires additional docs, update the explicit include list above in a new slice (no silent expansion).

## Export exclusions (explicit)

Excluded by default unless elevated in a future canonical slice:

- Maintainership/transition/installer internals (`install.sh`, transition records, installer contracts).
- Maintenance/ops convenience docs not required for downstream consumption.
- Migration/history records (for example memory migration maps).
- `Heartloom-AI-Policies/required-reference-docs.md` (references working-pack and local-only artifacts).
- `Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md` (superseded by export-safe index in this pack).
- Repo-level navigation not scoped to this Reference Pack (for example repo `README.md` / `INDEX.md`).
- Pointer shims at repo root (canonical policy versions are included instead).
- Dotfiles, `.git/`, and non-markdown files unless explicitly required.
- Future `~/.codex` runtime-source artifacts and other operator tooling.

## Naming/version/date posture

Artifact name pattern:

- `00_Identity-ChatGPT-YYYY-MM-DD.zip`

Date is the primary postfix. If a future naming change is needed (for example adding a short commit SHA), update this contract explicitly in the same slice.

## Staging and generation location

- **Script:** `scripts/export-chatgpt-00-identity-zip.sh`
- **Manifest:** `scripts/chatgpt-00-identity-export.manifest`
- **Staging directory (vault):** `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`
- **Logs directory (vault):** `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump/<YYYY-MM-DD>/`

Exports are built in internal storage first, then staged into the vault staging directory to preserve a clear repo-source vs exported-artifact boundary.

## Provenance expectations

Every export should record:

- Source repo (`heartloom-identity`).
- Commit SHA used for the export.
- Export date (UTC).
- Export contract version (`v1.0`).
- Manifest file path used.

The export script writes a sidecar provenance file next to the zip and prints the same details to stdout. It also generates a `ChatGPT_Reference_Pack_Manifest.md` file inside the export zip.

## Relationship to bundle publishing

This export is **not** the same as a future published bundle/release. It is a downstream snapshot for the ChatGPT project only. Bundle publishing remains defined by:

- `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md`
- `Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md`

## Hard Stop Conditions

- STOP if this export contract conflicts with current canonical docs.
- STOP if the include/exclude set cannot be defined without guessing.
- STOP if implementation would blur canonical source with the export artifact.
- STOP if script behavior would silently overwrite unrelated files.
- STOP instead of touching termux-utils in this slice.
- STOP if the export path cannot be chosen without conflicting with existing installer/export conventions.

ChatGPT_Project_00_Identity_Export_Contract_v1_0.md EOF
