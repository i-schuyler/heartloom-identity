# Protocols Index
*Canonical navigation for HeartloomVault’s meta-layer.*

## Recommended reading order

If you are new to this repo, read these first:

1. **README.md** — immediate source→identity orientation and where to start.
2. **Source_Alignment_Contract_heartloom_identity_v1_0.md** — upstream/downstream boundary and anti-drift contract.
3. **Repo_Ecosystem_Map_heartloom_identity_v1_0.md** — ecosystem layer map across upstream, identity, and downstream repos.
4. **Alignment_Review_Checklist_heartloom_identity_v1_0.md** — repeatable anti-drift review flow for humans and future agents.
5. **Distinctions_Library_heartloom_identity_v1_0.md** — small reusable vocabulary for repeatable source-alignment review and routing.
6. **Change_Control_Heartloom_Identity_Canonical_Repo_Authority_v1_0.md** — current authority posture and transition record.
7. **Change_Control_Heartloom_Identity_Rename_v1_0.md** — canonical rename/path compatibility change-control before implementation.

Primary reading order is defined by the manifest:

- **`Heartloom_Identity_Protocols_Reading_Order_v1_0.md`** — canonical Protocols reading order for the PDF build.

If you want a short “start here” sequence:

1. **README.md** — what this folder is, what is upstream/downstream, and where to start.
2. **Source_Alignment_Contract_heartloom_identity_v1_0.md** — canonical source-alignment and bounded-translation contract between upstream source and identity-layer implementation shaping.
3. **Repo_Ecosystem_Map_heartloom_identity_v1_0.md** — canonical ecosystem layer map and newcomer navigation across upstream, identity, and downstream repos.
4. **Alignment_Review_Checklist_heartloom_identity_v1_0.md** — canonical repeatable anti-drift checklist for source-alignment reviews.
5. **Distinctions_Library_heartloom_identity_v1_0.md** — canonical distinctions vocabulary for source-alignment review, routing, and anti-drift naming.
6. **Change_Control_Heartloom_Identity_Canonical_Repo_Authority_v1_0.md** — authority transition completion record for repo-canonical `Heartloom Identity` authoring.
7. **Install_Contract_heartloom_identity_repo_sync_v1_0.md** — implemented installer contract for repo-root `install.sh` sync into vault `Heartloom-Identity` target (legacy alias sync retired).
8. **Authority_Transition_Gate_Installer_Validation_v1_0.md** — canonical transition gate definition plus recorded READY/completion evidence.
9. **Consumer_Integration_Model_heartloom_identity_v1_0.md** — canonical cross-repo consumer pattern (near-term snapshots, long-term versioned bundle model, override boundaries, upstream proposal flow).
10. **Bundle_Versioning_Semantics_heartloom_identity_v1_0.md** — canonical bundle purpose, inclusion/exclusion boundary, version pinning expectations, and upgrade posture (semantics defined now; release tooling later).
11. **Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md** — canonical manifest fields, content enumeration expectations, and release-prep readiness criteria (semantics defined now; publication remains future work).
12. **First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md** — first concrete v0 bundle candidate include/exclude boundary optimized for downstream consumer use and prompt-template style consumption.
13. **ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md** — canonical export contract for the ChatGPT-project `Heartloom Identity` zip artifact (downstream export; not a published bundle).
14. **CI_Auto_Merge_Policy_heartloom_identity_v1_0.md** — canonical required-check baseline, merge readiness criteria, auto-merge posture, and branch cleanup posture (policy defined now; implementation/settings later).
15. **Codex_Global_Source_Install_Contract_heartloom_identity_v1_0.md** — canonical source path and `~/.codex/` target mapping contract for future global Codex runtime files (explicit install posture; implementation later).
16. **Codex_Execution_Profiles_Contract_heartloom_identity_v1_0.md** — canonical execution profiles for Codex runtime behavior (safe default and GitHub/PR profile) with config vs instruction boundaries.
17. **Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md** — map of the enforcement-layer policies.
18. **Heartloom-AI-Policies/authority-boundary-map-v1.0.md** — authority ladder + “you/we” interpretation + cross-project visibility limits.
19. **Heartloom-AI-Policies/required-reference-docs.md** — always-refer docs (stable base + per-project).
20. **Heartloom-AI-Policies/heartloom-ai-operating-protocol-v1.0.md** — the canonical operating protocol (pointer files exist elsewhere; this is source-of-truth).
21. **Heartloom_AI_Memory_Constitution.md** — memory and consent rules (canonical location: Protocols root).
22. **github-governance-policy.md** + **github-repo-intake-checklist.md** — repo governance + intake workflow.
23. **Codex_CLI_Termux_Setup_v1_0.md** — Codex CLI setup and safe operation.
24. **House_Defaults_v1_0.md** + **Tools_Shortlist_v1_0.md** + **Definitions_Glossary_v1_0.md** — defaults, tools, shared language.
25. **Docs_Full_Audit_heartloom_identity_2026-04-07.md** — repo-wide documentation audit report (conflicts, drift risks, discoverability gaps).
26. **Identity_Pack_Architecture_heartloom_identity_v1_0.md** — Reference Pack vs Working Pack architecture and artifact boundary definitions.
27. **exports/chatgpt-reference-pack/README.md** — export-safe navigation for the ChatGPT Reference Pack.
28. **Identity_Layer_Output_Contract_heartloom_identity_v1_0.md** — canonical identity-layer output contract and workflow learnings.
29. **Stable_Base_Working_Pack_Contract_heartloom_identity_v1_0.md** — Working Pack / Stable Base contract (local/generated/sensitive artifact boundaries).
30. **Change_Control_Heartloom_Identity_Rename_v1_0.md** — canonical legacy-to-`Heartloom Identity` rename/path compatibility decision record (phase 1 implemented).
31. **Heartloom_Identity_Migration_Validation_v1_0.md** — validation evidence for canonical rename coherence and remaining compatibility alias debt classification.

## Maintenance triggers

- If a key term’s meaning changes (“canonical”, “drift”, “pause point”, “forensic”, “done/DoD”), update **Definitions_Glossary_v1_0.md**.
- If a workflow default changes (branch naming, CI baseline, artifact set), update **House_Defaults_v1_0.md**.
- If source-vs-identity role boundaries or anti-drift translation rules change, update **Source_Alignment_Contract_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If alignment review flow, drift signals, or routing outcomes change, update **Alignment_Review_Checklist_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If distinctions naming, boundaries, or usage guidance changes, update **Distinctions_Library_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If ecosystem-layer repo mapping or newcomer navigation boundaries change, update **Repo_Ecosystem_Map_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If canon authority boundaries or install-source rules change, update **Change_Control_Heartloom_Identity_Canonical_Repo_Authority_v1_0.md** (or its successor) in the same slice.
- If canonical identity naming/path compatibility rules change for legacy alias handling ↔ `Heartloom Identity`, update **Change_Control_Heartloom_Identity_Rename_v1_0.md** (or its successor) in the same slice.
- If compatibility alias debt posture changes (retained vs retired), update **Heartloom_Identity_Migration_Validation_v1_0.md** (or its successor) in the same slice.
- If installer source/destination mapping or overwrite/delete semantics change, update **Install_Contract_heartloom_identity_repo_sync_v1_0.md** (or its successor) in the same slice.
- If authority transition readiness criteria change, update **Authority_Transition_Gate_Installer_Validation_v1_0.md** (or its successor) in the same slice.
- If consumer integration/override governance rules change, update **Consumer_Integration_Model_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If bundle scope/versioning semantics change, update **Bundle_Versioning_Semantics_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If bundle manifest or release-prep semantics change, update **Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If first bundle candidate scope selection changes, update **First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If CI required-check/auto-merge/branch-cleanup policy changes, update **CI_Auto_Merge_Policy_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If Codex global source/target/install contract semantics change, update **Codex_Global_Source_Install_Contract_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If Codex execution profile semantics change, update **Codex_Execution_Profiles_Contract_heartloom_identity_v1_0.md** (or its successor) in the same slice.
- If a new protocol doc is added, link it here in the appropriate place.

## Run tools (phone-first)

These are Termux helpers that support “ZIP-TENNIS” review and final identity artifacts:

- **Repo → vault installer:** `./install.sh` (`--dry-run` supported)
- **ChatGPT export zip (staged to vault):** `scripts/export-chatgpt-heartloom-identity-zip.sh`
- **Stable Base reference pack zip:** `hl-zip-stable-base`

Outputs are staged to:

- `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`

Logs are written to:

- `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump`

## Current canon versions (manual quick-check)

- Stable Base pack: `Stable_Base-2026-02-12.zip`
- Protocols reading order: `Heartloom_Identity_Protocols_Reading_Order_v1_0.md`
- Protocols PDF: `Heartloom-Identity-Protocols-2026-02-12.pdf`

INDEX.md EOF
