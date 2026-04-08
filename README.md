# heartloom-identity

Canonical downstream identity-layer repository for Heartloom repo inheritance, workflow, pack, export, and ecosystem shaping.

## Upstream relationship (explicit)

`heartloom-identity` is downstream of [`heartloom-source`](https://github.com/i-schuyler/heartloom-source).

`heartloom-source` is the repository/container of the closest currently available source texts for Heartloom’s deepest meaning, law, and orientation. It is not the source of Heartloom itself.

`heartloom-identity` is the active translation/inheritance layer that converts upstream orientation into repo inheritance, workflow, pack, export, and ecosystem-shaping structures. This repo must not silently redefine source meaning, law, or orientation.

## If you’re new here

- If you want Heartloom’s upstream meaning, law, and orientation, start with `heartloom-source`.
- If you want identity-layer translation and operational structure (inheritance/workflow/packs/exports/ecosystem), continue here in `heartloom-identity`.
- Start in this order: `Source_Alignment_Contract_heartloom_identity_v1_0.md` → `Repo_Ecosystem_Map_heartloom_identity_v1_0.md` → `INDEX.md`.

## Core upstream references

- [`heartloom-source` README](https://github.com/i-schuyler/heartloom-source/blob/main/README.md)
- [`Source_to_Identity_Relationship_Contract_v1_0.md`](https://github.com/i-schuyler/heartloom-source/blob/main/Source_to_Identity_Relationship_Contract_v1_0.md)
- [`Canonical_Law/HEARTLOOM OS — CORE ONTOLOGY v3.0.md`](https://github.com/i-schuyler/heartloom-source/blob/main/Canonical_Law/HEARTLOOM%20OS%20%E2%80%94%20CORE%20ONTOLOGY%20v3.0.md)

## Ecosystem navigation

- Canonical ecosystem map: `Repo_Ecosystem_Map_heartloom_identity_v1_0.md`
- Canonical source-alignment contract: `Source_Alignment_Contract_heartloom_identity_v1_0.md`
- Canonical alignment review checklist: `Alignment_Review_Checklist_heartloom_identity_v1_0.md`

## Historical bootstrap context
This repository began as a Git-tracked copy of the vault `00_Identity` folder and now operates as the canonical identity-layer translation/inheritance repo.

## Authority note
The dedicated Change-Control docs slice is documented in:

- `Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md`
- `Install_Contract_heartloom_identity_repo_sync_v1_0.md`
- `Authority_Transition_Gate_Installer_Validation_v1_0.md`
- `Consumer_Integration_Model_heartloom_identity_v1_0.md`

Current authority state: repo-canonical authoring transition is completed, while vault remains the installed/consumed downstream copy at `/storage/emulated/0/Documents/HeartloomVault/00_Identity/`.

## Current authority status

- Repo-canonical `00_Identity` authority transition is **completed**.
- Vault `00_Identity` is the installer-managed installed/consumed downstream copy.
- Clipboard-return rule canonization is implemented in policy docs only.

## Installer

- Repo-root installer exists at `./install.sh`.
- Supported mode: sync-copy upsert without prune (no vault-file deletions).
- Dry run: `./install.sh --dry-run`
- Apply install: `./install.sh`
- Installer execution follows contract semantics; authority-state decisions are governed by Change-Control and gate records.

## Authority transition gate

- Practical authority transition gate is satisfied and recorded.
- Canonical gate checklist: `Authority_Transition_Gate_Installer_Validation_v1_0.md`

## Consumer integration model

- Canonical consumer model doc: `Consumer_Integration_Model_heartloom_identity_v1_0.md`
- Canonical bundle/versioning semantics doc: `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md`
- Canonical bundle manifest/release-prep semantics doc: `Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md`
- Canonical first bundle candidate scope doc: `First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md`
- Canonical pack architecture doc: `Identity_Pack_Architecture_heartloom_identity_v1_0.md`
- Canonical Stable Base / Working Pack contract: `Stable_Base_Working_Pack_Contract_heartloom_identity_v1_0.md`
- Near-term model: local installed snapshot consumption.
- Long-term model: versioned release artifact / packaged bundle distribution (proposed, not implemented).

## ChatGPT export artifact

- Canonical export contract: `ChatGPT_Project_00_Identity_Export_Contract_v1_0.md`
- Export script: `scripts/export-chatgpt-00-identity-zip.sh`
- Export-safe navigation: `exports/chatgpt-reference-pack/README.md`
- Default output path: `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`
- Default log path: `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump/<YYYY-MM-DD>/`

## CI and auto-merge policy

- Canonical policy doc: `CI_Auto_Merge_Policy_heartloom_identity_v1_0.md`
- Lightweight CI workflow is implemented at `.github/workflows/ci.yml`.
- GitHub settings rollout remains a separate implementation/admin step.

## Codex global source/install contract

- Canonical contract doc: `Codex_Global_Source_Install_Contract_heartloom_identity_v1_0.md`
- Global Codex sources live under `tooling/codex-global/`.
- Explicit opt-in install mode: `./install.sh --codex-global` installs into `~/.codex/`.

## Codex execution profiles contract

- Canonical contract doc: `Codex_Execution_Profiles_Contract_heartloom_identity_v1_0.md`
- Contract defines safe default and GitHub/PR execution profiles, clarifies config vs instruction layers, and preserves future implementation boundaries.

## Codex workflow (repo-specific)

- This repo uses a Codex-prompt-only flow: assistants should not provide manual branch checkout/push/PR/cleanup command blocks for this repo.
- Codex should attempt per-PR auto-merge enablement when supported and report the exact reason if it cannot be enabled.
- Safe stale-branch cleanup is expected at the start of Codex runs (local-only; remote cleanup relies on GitHub settings after merge).
- Canonical output contract for identity-layer slices: `Identity_Layer_Output_Contract_heartloom_identity_v1_0.md`

## Codex push/PR smoke test note

- Tiny docs-only change to verify Codex push and PR creation behavior.
