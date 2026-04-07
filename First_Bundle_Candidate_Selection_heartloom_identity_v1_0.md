# First Bundle Candidate Selection: heartloom-identity (v1.0)

Status: **CANONICAL CANDIDATE SCOPE DEFINED (candidate only; no published bundle/tooling)**  
Type: Consumer-facing v0 bundle-candidate scope definition  
Scope: Concrete include/exclude selection for the first downstream bundle candidate

## Purpose

Define the first concrete bundle candidate ("v0 bundle candidate") using the already-canonical bundle/versioning, manifest/release-prep, and consumer integration semantics.

This document defines **scope selection only**. It does **not** implement release tooling, bundle generation, installer behavior, or publication.

## Implemented vs future state (required clarity)

- **Implemented now:** repo-canonical authority transition is complete.
- **Implemented now:** near-term consumer model remains installer-managed local snapshot consumption.
- **Defined now for future use:** first concrete bundle candidate scope and rationale.
- **Not implemented yet:** published versioned bundle artifacts and bundle-release automation.

## Proposed v0 bundle candidate name

- `heartloom-identity-consumer-canon-v0-candidate`

This is a scope-definition label, not an already-published artifact.

## Optimized downstream consumer use cases

The v0 candidate is optimized for:

- Consumer repositories that need canonical policy/identity references with explicit pinning behavior.
- Prompt-template style consumption where `00_Identity` is treated as highest-authority reference material.
- Session-pack workflows where required reference docs are expected as active inputs.
- Human-reviewed upgrades where scope changes are visible and intentional.

## Included content (v0 candidate)

### A) Bundle contract + consumer integration docs

- `Consumer_Integration_Model_heartloom_identity_v1_0.md`
- `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md`
- `Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md`
- `First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md`

**Why included:** These documents define consumer behavior, pinning posture, manifest expectations, release-readiness semantics, and this concrete candidate boundary.

### B) Consumer discoverability/navigation docs (current repo variants)

- `README.md`
- `INDEX.md`

**Why included:** Consumers need canonical entry points to find and interpret bundle docs.

### C) Heartloom AI policy canon needed for active downstream use

- `Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md`
- `Heartloom-AI-Policies/required-reference-docs.md`
- `Heartloom-AI-Policies/authority-boundary-map-v1.0.md`
- `Heartloom-AI-Policies/heartloom-ai-operating-protocol-v1.0.md`
- `Heartloom-AI-Policies/termux-and-shell-policy-v1.0.md`
- `Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`
- `Heartloom-AI-Policies/repo-standards-baseline-v1.0.md`
- `Heartloom-AI-Policies/zip-inspection-and-artifact-contract-v1.0.md`
- `Heartloom-AI-Policies/global-memories-refactored-set-v2.0.md`

**Why included:** These are the consumer-facing policy references most directly tied to prompt-template and required-reference style downstream consumption.

### D) Core identity docs commonly used as downstream authority references

- `Heartloom_AI_Operating_Protocol.md`
- `Heartloom_AI_Memory_Constitution.md`
- `Definitions_Glossary_v1_0.md`
- `github-governance-policy.md`
- `github-repo-intake-checklist.md`
- `Repo_Standards_Baseline.md`

**Why included:** These are frequently treated as foundational identity/operational references by downstream consumers and session-pack style usage.

## Excluded content (v0 candidate)

### A) Maintainership/transition/installer-internal artifacts

- `Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md`
- `Authority_Transition_Gate_Installer_Validation_v1_0.md`
- `Install_Contract_heartloom_identity_repo_sync_v1_0.md`
- `install.sh`

**Why excluded:** These are maintainership/transition/installer internals and are not required by default for downstream canonical consumption.

### B) Maintenance/tooling/ops convenience docs not needed for baseline canon following

- `Identity_Maintenance_Triggers_v1_0.md`
- `Codex_CLI_Termux_Setup_v1_0.md`
- `House_Defaults_v1_0.md`
- `Tools_Shortlist_v1_0.md`
- `00_Identity_Protocols_Reading_Order_v1_0.md`

**Why excluded:** Helpful for maintainers/operators, but not required for a conservative first consumer bundle boundary.

### C) Migration/history/internal transition records

- `Heartloom-AI-Policies/memory-migration-map-2026-02-02-to-v1.0.md`

**Why excluded:** Historical migration mapping is not needed for routine downstream canon-following.

### D) Structural and non-consumer internals

- `.git/`
- Dotfiles/local environment files
- Non-markdown files unless explicitly required in a future slice

**Why excluded:** Not consumer-facing canonical content.

## Consumer-facing vs maintainership distinction

- **Consumer-facing canonical docs:** policy canon, required-reference guidance, integration/bundle semantics, and core identity docs needed to follow canon.
- **Maintainership/internal docs:** authority transition records, installer contract mechanics, installer scripts, migration maps, and maintainer workflow aids.

v0 candidate defaults to consumer-facing canon and excludes maintainership internals unless future use-cases prove necessity.

## README/INDEX consumer variant posture

- **Current v0 candidate decision:** include existing `README.md` and `INDEX.md` for discoverability.
- **Future recommendation:** create explicit consumer-facing bundle variants (for example `README.consumer.md` and `INDEX.consumer.md`) if repo-level navigation keeps growing maintainer/internal references.

This recommendation is docs-only and does not create variant files in this slice.

## Consistency with existing bundle semantics

This v0 candidate follows:

- `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md` (subset boundary + inclusion/exclusion philosophy + pinning posture)
- `Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md` (manifest fields + release-readiness criteria)
- `Consumer_Integration_Model_heartloom_identity_v1_0.md` (downstream use + override governance)

This candidate scope definition does not imply publication is already implemented or active.

## Non-goals in this slice

- No release automation.
- No bundle generation tooling.
- No installer code changes.
- No authority changes.
- No CI changes.
- No session-pack automation.
- No repo restructuring.
- No consumer tooling implementation.

First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md EOF
