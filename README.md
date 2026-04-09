# heartloom-identity

Canonical downstream identity-layer repository for Heartloom repo inheritance, workflow, pack, export, and ecosystem shaping.

## Upstream relationship (explicit)

`heartloom-identity` is downstream of [`heartloom-source`](https://github.com/i-schuyler/heartloom-source).

`heartloom-source` is the repository/container of the closest currently available source texts for Heartloom’s deepest meaning, law, and orientation. It is not the source of Heartloom itself.

`heartloom-identity` is the active translation/inheritance layer that converts upstream orientation into repo inheritance, workflow, pack, export, and ecosystem-shaping structures. This repo must not silently redefine source meaning, law, or orientation.

## If you’re new here

- **Primary newcomer entrypoint:** this `README.md` is the canonical human starting surface for `heartloom-identity`.
- If you want Heartloom’s upstream meaning, law, and orientation, start with `heartloom-source`.
- If you want identity-layer translation and operational structure (inheritance/workflow/packs/exports/ecosystem), continue here in `heartloom-identity`.
- Canonical newcomer path in this repo: [`Contracts/Source_Alignment_Contract_v1_0.md`](Contracts/Source_Alignment_Contract_v1_0.md) → [`Maps/Repo_Ecosystem_Map_v1_0.md`](Maps/Repo_Ecosystem_Map_v1_0.md) → [`INDEX.md`](INDEX.md).
- Full navigation hub after this entrypoint: [`INDEX.md`](INDEX.md).
- Supporting guided ordered route (not the primary newcomer authority): [`Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md`](Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md).

## Core upstream references

- [`heartloom-source` README](https://github.com/i-schuyler/heartloom-source/blob/main/README.md)
- [`Source_to_Identity_Relationship_Contract_v1_0.md`](https://github.com/i-schuyler/heartloom-source/blob/main/Source_to_Identity_Relationship_Contract_v1_0.md)
- [`Canonical_Law/HEARTLOOM OS — CORE ONTOLOGY v3.0.md`](https://github.com/i-schuyler/heartloom-source/blob/main/Canonical_Law/HEARTLOOM%20OS%20%E2%80%94%20CORE%20ONTOLOGY%20v3.0.md)

## Ecosystem navigation

- Canonical ecosystem map: [`Maps/Repo_Ecosystem_Map_v1_0.md`](Maps/Repo_Ecosystem_Map_v1_0.md)
- Canonical source-alignment contract: [`Contracts/Source_Alignment_Contract_v1_0.md`](Contracts/Source_Alignment_Contract_v1_0.md)
- Canonical alignment review checklist: [`Checklists/Alignment_Review_Checklist_v1_0.md`](Checklists/Alignment_Review_Checklist_v1_0.md)
- Canonical distinctions library: [`Reference/Distinctions_Library_v1_0.md`](Reference/Distinctions_Library_v1_0.md)
- Latest full docs audit: [`Reference/Docs_Full_Audit_2026-04-08.md`](Reference/Docs_Full_Audit_2026-04-08.md)

## Documentation layout

- `Contracts/` — canonical contracts and boundary definitions.
- `Maps/` — ecosystem, architecture, and reading-order maps.
- `Checklists/` — operational and validation checklists.
- `Reference/` — glossary/defaults/setup and supporting reference docs.
- `Policies/` — governance/policy docs and policy-pointer shims.
- `Change_Control/` — authority/rename transition records and validation evidence.
- `Exports/` — export-specific contracts.
- `Scripts/` — operational/export automation scripts.
- `Tooling/` — source-controlled tooling/runtime config assets.

## Authority note
The dedicated Change-Control docs slice is documented in:

- [`Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md`](Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md)
- [`Change_Control/Change_Control_Rename_v1_0.md`](Change_Control/Change_Control_Rename_v1_0.md)
- [`Contracts/Install_Contract_Repo_Sync_v1_0.md`](Contracts/Install_Contract_Repo_Sync_v1_0.md)
- [`Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md`](Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md)
- [`Reference/Consumer_Integration_Model_v1_0.md`](Reference/Consumer_Integration_Model_v1_0.md)

## Current authority status

- Repo-canonical `Heartloom Identity` authority transition is **completed**.
- Vault `Heartloom-Identity` can be an installer-managed downstream copy when explicitly requested.
- Active installer/export legacy compatibility bridges are retired; only minimal historical rename record remains.
- Current migration validation/audit record: [`Change_Control/Heartloom_Identity_Migration_Validation_v1_0.md`](Change_Control/Heartloom_Identity_Migration_Validation_v1_0.md).

## Installer

- Repo-root installer exists at `./install.sh`.
- Default behavior: no repo-to-vault sync unless explicitly opted in.
- Vault sync (explicit opt-in): `./install.sh --vault-sync`
- Dry run (explicit opt-in): `./install.sh --vault-sync --dry-run`
- Codex global config install (explicit opt-in): `./install.sh --codex-global`
- Preferred downstream path for ChatGPT use: staged zip export via [`Scripts/export-chatgpt-heartloom-identity-zip.sh`](Scripts/export-chatgpt-heartloom-identity-zip.sh).
- Installer execution follows contract semantics; authority-state decisions are governed by Change-Control and gate records.

## Authority transition gate

- Practical authority transition gate is satisfied and recorded.
- Canonical gate checklist: [`Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md`](Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md)

## Consumer integration model

- Canonical consumer model doc: [`Reference/Consumer_Integration_Model_v1_0.md`](Reference/Consumer_Integration_Model_v1_0.md)
- Canonical bundle/versioning semantics doc: [`Reference/Bundle_Versioning_Semantics_v1_0.md`](Reference/Bundle_Versioning_Semantics_v1_0.md)
- Canonical bundle manifest/release-prep semantics doc: [`Reference/Bundle_Manifest_Release_Prep_Semantics_v1_0.md`](Reference/Bundle_Manifest_Release_Prep_Semantics_v1_0.md)
- Canonical first bundle candidate scope doc: [`Reference/First_Bundle_Candidate_Selection_v1_0.md`](Reference/First_Bundle_Candidate_Selection_v1_0.md)
- Canonical pack architecture doc: [`Maps/Identity_Pack_Architecture_v1_0.md`](Maps/Identity_Pack_Architecture_v1_0.md)
- Canonical Stable Base / Working Pack contract: [`Contracts/Stable_Base_Working_Pack_Contract_v1_0.md`](Contracts/Stable_Base_Working_Pack_Contract_v1_0.md)
- Near-term model: local installed snapshot consumption.
- Long-term model: versioned release artifact / packaged bundle distribution (proposed, not implemented).

## ChatGPT export artifact

- Canonical export contract: [`Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md`](Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md)
- Export script: [`Scripts/export-chatgpt-heartloom-identity-zip.sh`](Scripts/export-chatgpt-heartloom-identity-zip.sh)
- Export-safe navigation: [`Exports/chatgpt-reference-pack/README.md`](Exports/chatgpt-reference-pack/README.md)
- Export reading flow: [`Exports/chatgpt-reference-pack/READING_ORDER.md`](Exports/chatgpt-reference-pack/READING_ORDER.md)
- Default output path: `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`
- Default log path: `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump/<YYYY-MM-DD>/`

## CI and auto-merge policy

- Canonical policy doc: [`Policies/CI_Auto_Merge_Policy_v1_0.md`](Policies/CI_Auto_Merge_Policy_v1_0.md)
- Lightweight CI workflow is implemented at `.github/workflows/ci.yml`.
- GitHub settings rollout remains a separate implementation/admin step.

## Codex global source/install contract

- Canonical contract doc: [`Contracts/Codex_Global_Source_Install_Contract_v1_0.md`](Contracts/Codex_Global_Source_Install_Contract_v1_0.md)
- Global Codex sources live under `Tooling/codex-global/`.
- Explicit opt-in install mode: `./install.sh --codex-global` installs into `~/.codex/`.

## Codex execution profiles contract

- Canonical contract doc: [`Contracts/Codex_Execution_Profiles_Contract_v1_0.md`](Contracts/Codex_Execution_Profiles_Contract_v1_0.md)
- Contract defines safe default and GitHub/PR execution profiles, clarifies config vs instruction layers, and preserves future implementation boundaries.

## Codex workflow (repo-specific)

- This repo uses a Codex-prompt-only flow: assistants should not provide manual branch checkout/push/PR/cleanup command blocks for this repo.
- Codex should attempt per-PR auto-merge enablement when supported and report the exact reason if it cannot be enabled.
- Safe stale-branch cleanup is expected at the start of Codex runs (local-only; remote cleanup relies on GitHub settings after merge).
- Canonical output contract for identity-layer slices: [`Contracts/Identity_Layer_Output_Contract_v1_0.md`](Contracts/Identity_Layer_Output_Contract_v1_0.md)
