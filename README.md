# heartloom-identity

Bootstrap working copy for the Heartloom `00_Identity` canon.

## Current status
This repository begins as a Git-tracked copy of the current vault `00_Identity` folder.

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
- Near-term model: local installed snapshot consumption.
- Long-term model: versioned release artifact / packaged bundle distribution (proposed, not implemented).

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

## Codex push/PR smoke test note

- Tiny docs-only change to verify Codex push and PR creation behavior.
