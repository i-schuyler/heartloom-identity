# Protocols Index
*Canonical navigation for HeartloomVault’s meta-layer.*

## Recommended reading order

If you are new to this repo, read these first:

1. **[README.md](README.md)** — immediate source→identity orientation and where to start.
2. **[Contracts/Source_Alignment_Contract_v1_0.md](Contracts/Source_Alignment_Contract_v1_0.md)** — upstream/downstream boundary and anti-drift contract.
3. **[Maps/Repo_Ecosystem_Map_v1_0.md](Maps/Repo_Ecosystem_Map_v1_0.md)** — ecosystem layer map across upstream, identity, and downstream repos.
4. **[Checklists/Alignment_Review_Checklist_v1_0.md](Checklists/Alignment_Review_Checklist_v1_0.md)** — repeatable anti-drift review flow for humans and future agents.
5. **[Reference/Distinctions_Library_v1_0.md](Reference/Distinctions_Library_v1_0.md)** — small reusable vocabulary for repeatable source-alignment review and routing.
6. **[Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md](Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md)** — current authority posture and transition record.
7. **[Change_Control/Change_Control_Rename_v1_0.md](Change_Control/Change_Control_Rename_v1_0.md)** — canonical rename/path compatibility change-control before implementation.

Primary reading order is defined by the manifest:

- **[`Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md`](Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md)** — canonical Protocols reading order for the PDF build.

If you want a short “start here” sequence:

1. **[README.md](README.md)** — what this folder is, what is upstream/downstream, and where to start.
2. **[Contracts/Source_Alignment_Contract_v1_0.md](Contracts/Source_Alignment_Contract_v1_0.md)** — canonical source-alignment and bounded-translation contract between upstream source and identity-layer implementation shaping.
3. **[Maps/Repo_Ecosystem_Map_v1_0.md](Maps/Repo_Ecosystem_Map_v1_0.md)** — canonical ecosystem layer map and newcomer navigation across upstream, identity, and downstream repos.
4. **[Checklists/Alignment_Review_Checklist_v1_0.md](Checklists/Alignment_Review_Checklist_v1_0.md)** — canonical repeatable anti-drift checklist for source-alignment reviews.
5. **[Reference/Distinctions_Library_v1_0.md](Reference/Distinctions_Library_v1_0.md)** — canonical distinctions vocabulary for source-alignment review, routing, and anti-drift naming.
6. **[Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md](Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md)** — authority transition completion record for repo-canonical `Heartloom Identity` authoring.
7. **[Contracts/Install_Contract_Repo_Sync_v1_0.md](Contracts/Install_Contract_Repo_Sync_v1_0.md)** — explicit opt-in installer contract for repo-root `install.sh --vault-sync` into vault `Heartloom-Identity` target (legacy alias sync retired).
8. **[Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md](Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md)** — canonical transition gate definition plus recorded READY/completion evidence.
9. **[Reference/Consumer_Integration_Model_v1_0.md](Reference/Consumer_Integration_Model_v1_0.md)** — canonical cross-repo consumer pattern (near-term snapshots, long-term versioned bundle model, override boundaries, upstream proposal flow).
10. **[Reference/Bundle_Versioning_Semantics_v1_0.md](Reference/Bundle_Versioning_Semantics_v1_0.md)** — canonical bundle purpose, inclusion/exclusion boundary, version pinning expectations, and upgrade posture (semantics defined now; release tooling later).
11. **[Reference/Bundle_Manifest_Release_Prep_Semantics_v1_0.md](Reference/Bundle_Manifest_Release_Prep_Semantics_v1_0.md)** — canonical manifest fields, content enumeration expectations, and release-prep readiness criteria (semantics defined now; publication remains future work).
12. **[Reference/First_Bundle_Candidate_Selection_v1_0.md](Reference/First_Bundle_Candidate_Selection_v1_0.md)** — first concrete v0 bundle candidate include/exclude boundary optimized for downstream consumer use and prompt-template style consumption.
13. **[Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md](Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md)** — canonical export contract for the ChatGPT-project `Heartloom Identity` zip artifact (downstream export; not a published bundle).
14. **[Policies/CI_Auto_Merge_Policy_v1_0.md](Policies/CI_Auto_Merge_Policy_v1_0.md)** — canonical required-check baseline, merge readiness criteria, auto-merge posture, and branch cleanup posture (policy defined now; implementation/settings later).
15. **[Contracts/Codex_Global_Source_Install_Contract_v1_0.md](Contracts/Codex_Global_Source_Install_Contract_v1_0.md)** — canonical source path and `~/.codex/` target mapping contract for future global Codex runtime files (explicit install posture; implementation later).
16. **[Contracts/Codex_Execution_Profiles_Contract_v1_0.md](Contracts/Codex_Execution_Profiles_Contract_v1_0.md)** — canonical execution profiles for Codex runtime behavior (safe default and GitHub/PR profile) with config vs instruction boundaries.
17. **[Policies/AI/heartloom-ai-policy-index-v1.0.md](Policies/AI/heartloom-ai-policy-index-v1.0.md)** — map of the enforcement-layer policies.
18. **[Policies/AI/authority-boundary-map-v1.0.md](Policies/AI/authority-boundary-map-v1.0.md)** — authority ladder + “you/we” interpretation + cross-project visibility limits.
19. **[Policies/AI/required-reference-docs.md](Policies/AI/required-reference-docs.md)** — always-refer docs (stable base + per-project).
20. **[Policies/AI/heartloom-ai-operating-protocol-v1.0.md](Policies/AI/heartloom-ai-operating-protocol-v1.0.md)** — the canonical operating protocol (pointer files exist elsewhere; this is source-of-truth).
21. **[Policies/Heartloom_AI_Memory_Constitution.md](Policies/Heartloom_AI_Memory_Constitution.md)** — memory and consent rules.
22. **[Policies/github-governance-policy.md](Policies/github-governance-policy.md)** + **[Checklists/github-repo-intake-checklist.md](Checklists/github-repo-intake-checklist.md)** — repo governance + intake workflow.
23. **[Reference/Codex_CLI_Termux_Setup_v1_0.md](Reference/Codex_CLI_Termux_Setup_v1_0.md)** — Codex CLI setup and safe operation.
24. **[Reference/House_Defaults_v1_0.md](Reference/House_Defaults_v1_0.md)** + **[Reference/Tools_Shortlist_v1_0.md](Reference/Tools_Shortlist_v1_0.md)** + **[Reference/Definitions_Glossary_v1_0.md](Reference/Definitions_Glossary_v1_0.md)** — defaults, tools, shared language.
25. **[Reference/Docs_Full_Audit_2026-04-08.md](Reference/Docs_Full_Audit_2026-04-08.md)** — full repo documentation audit report (redundancy, conflicts, staleness, supersession, and cleanup priorities).
26. **[Maps/Identity_Pack_Architecture_v1_0.md](Maps/Identity_Pack_Architecture_v1_0.md)** — Reference Pack vs Working Pack architecture and artifact boundary definitions.
27. **[Exports/chatgpt-reference-pack/README.md](Exports/chatgpt-reference-pack/README.md)** + **[Exports/chatgpt-reference-pack/READING_ORDER.md](Exports/chatgpt-reference-pack/READING_ORDER.md)** — export-safe navigation + reading flow for the ChatGPT Reference Pack.
28. **[Contracts/Identity_Layer_Output_Contract_v1_0.md](Contracts/Identity_Layer_Output_Contract_v1_0.md)** — canonical identity-layer output contract and workflow learnings.
29. **[Contracts/Stable_Base_Working_Pack_Contract_v1_0.md](Contracts/Stable_Base_Working_Pack_Contract_v1_0.md)** — Working Pack / Stable Base contract (local/generated/sensitive artifact boundaries).
30. **[Change_Control/Change_Control_Rename_v1_0.md](Change_Control/Change_Control_Rename_v1_0.md)** — canonical legacy-to-`Heartloom Identity` rename/path compatibility decision record (phase 1 implemented).
31. **[Change_Control/Heartloom_Identity_Migration_Validation_v1_0.md](Change_Control/Heartloom_Identity_Migration_Validation_v1_0.md)** — validation evidence for canonical rename coherence and remaining compatibility alias debt classification.

## Maintenance triggers

- If a key term’s meaning changes (“canonical”, “drift”, “pause point”, “forensic”, “done/DoD”), update **[Reference/Definitions_Glossary_v1_0.md](Reference/Definitions_Glossary_v1_0.md)**.
- If a workflow default changes (branch naming, CI baseline, artifact set), update **[Reference/House_Defaults_v1_0.md](Reference/House_Defaults_v1_0.md)**.
- If source-vs-identity role boundaries or anti-drift translation rules change, update **[Contracts/Source_Alignment_Contract_v1_0.md](Contracts/Source_Alignment_Contract_v1_0.md)** (or its successor) in the same slice.
- If alignment review flow, drift signals, or routing outcomes change, update **[Checklists/Alignment_Review_Checklist_v1_0.md](Checklists/Alignment_Review_Checklist_v1_0.md)** (or its successor) in the same slice.
- If distinctions naming, boundaries, or usage guidance changes, update **[Reference/Distinctions_Library_v1_0.md](Reference/Distinctions_Library_v1_0.md)** (or its successor) in the same slice.
- If ecosystem-layer repo mapping or newcomer navigation boundaries change, update **[Maps/Repo_Ecosystem_Map_v1_0.md](Maps/Repo_Ecosystem_Map_v1_0.md)** (or its successor) in the same slice.
- If canon authority boundaries or install-source rules change, update **[Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md](Change_Control/Change_Control_Canonical_Repo_Authority_v1_0.md)** (or its successor) in the same slice.
- If canonical identity naming/path compatibility rules change for legacy alias handling ↔ `Heartloom Identity`, update **[Change_Control/Change_Control_Rename_v1_0.md](Change_Control/Change_Control_Rename_v1_0.md)** (or its successor) in the same slice.
- If compatibility alias debt posture changes (retained vs retired), update **[Change_Control/Heartloom_Identity_Migration_Validation_v1_0.md](Change_Control/Heartloom_Identity_Migration_Validation_v1_0.md)** (or its successor) in the same slice.
- If installer source/destination mapping or overwrite/delete semantics change, update **[Contracts/Install_Contract_Repo_Sync_v1_0.md](Contracts/Install_Contract_Repo_Sync_v1_0.md)** (or its successor) in the same slice.
- If authority transition readiness criteria change, update **[Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md](Checklists/Authority_Transition_Gate_Installer_Validation_v1_0.md)** (or its successor) in the same slice.
- If consumer integration/override governance rules change, update **[Reference/Consumer_Integration_Model_v1_0.md](Reference/Consumer_Integration_Model_v1_0.md)** (or its successor) in the same slice.
- If bundle scope/versioning semantics change, update **[Reference/Bundle_Versioning_Semantics_v1_0.md](Reference/Bundle_Versioning_Semantics_v1_0.md)** (or its successor) in the same slice.
- If bundle manifest or release-prep semantics change, update **[Reference/Bundle_Manifest_Release_Prep_Semantics_v1_0.md](Reference/Bundle_Manifest_Release_Prep_Semantics_v1_0.md)** (or its successor) in the same slice.
- If first bundle candidate scope selection changes, update **[Reference/First_Bundle_Candidate_Selection_v1_0.md](Reference/First_Bundle_Candidate_Selection_v1_0.md)** (or its successor) in the same slice.
- If CI required-check/auto-merge/branch-cleanup policy changes, update **[Policies/CI_Auto_Merge_Policy_v1_0.md](Policies/CI_Auto_Merge_Policy_v1_0.md)** (or its successor) in the same slice.
- If Codex global source/target/install contract semantics change, update **[Contracts/Codex_Global_Source_Install_Contract_v1_0.md](Contracts/Codex_Global_Source_Install_Contract_v1_0.md)** (or its successor) in the same slice.
- If Codex execution profile semantics change, update **[Contracts/Codex_Execution_Profiles_Contract_v1_0.md](Contracts/Codex_Execution_Profiles_Contract_v1_0.md)** (or its successor) in the same slice.
- If a new protocol doc is added, link it here in the appropriate place.

## Run tools (phone-first)

These are Termux helpers that support “ZIP-TENNIS” review and final identity artifacts:

- **Repo → vault installer (opt-in only):** `./install.sh --vault-sync` (`--dry-run` supported)
- **ChatGPT export zip (staged to vault):** `Scripts/export-chatgpt-heartloom-identity-zip.sh`
- **Stable Base reference pack zip:** `hl-zip-stable-base`

Outputs are staged to:

- `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`

Logs are written to:

- `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump`

## Current canon versions (manual quick-check)

- Stable Base pack: `Stable_Base-2026-02-12.zip`
- Protocols reading order: [`Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md`](Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md)
- Protocols PDF: `Heartloom-Identity-Protocols-2026-02-12.pdf`

INDEX.md EOF
