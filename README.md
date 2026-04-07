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

Current behavior is unchanged: the vault/session-pack workflow remains authoritative until a later implementation slice completes the proposed authority model.

## Proposal status

- Repo-canonical `00_Identity` authority is **proposed**, not implemented.
- Clipboard-return rule canonization is implemented in policy docs only.

## Installer

- Repo-root installer exists at `./install.sh`.
- Supported mode: sync-copy upsert without prune (no vault-file deletions).
- Dry run: `./install.sh --dry-run`
- Apply install: `./install.sh`
- Installer implementation does not flip authority; authority change remains governed by Change-Control.

## Authority transition gate

- Practical authority transition is pending until validation gate criteria are satisfied.
- Canonical gate checklist: `Authority_Transition_Gate_Installer_Validation_v1_0.md`

## Consumer integration model

- Canonical consumer model doc: `Consumer_Integration_Model_heartloom_identity_v1_0.md`
- Near-term model: local installed snapshot consumption.
- Long-term model: versioned release artifact / packaged bundle distribution (proposed, not implemented).
