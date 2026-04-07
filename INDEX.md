# Protocols Index
*Canonical navigation for HeartloomVault’s meta-layer.*

## Recommended reading order

Primary reading order is defined by the manifest:

- **`00_Identity_Protocols_Reading_Order_v1_0.md`** — canonical Protocols reading order for the PDF build.

If you want a short “start here” sequence:

1. **README.md** — what this folder is and what belongs here.
2. **Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md** — authority transition completion record for repo-canonical `00_Identity` authoring.
3. **Install_Contract_heartloom_identity_repo_sync_v1_0.md** — implemented installer contract for repo-root `install.sh` sync into vault `00_Identity` target.
4. **Authority_Transition_Gate_Installer_Validation_v1_0.md** — canonical transition gate definition plus recorded READY/completion evidence.
5. **Consumer_Integration_Model_heartloom_identity_v1_0.md** — canonical cross-repo consumer pattern (near-term snapshots, long-term versioned bundle model, override boundaries, upstream proposal flow).
6. **Bundle_Versioning_Semantics_heartloom_identity_v1_0.md** — canonical bundle purpose, inclusion/exclusion boundary, version pinning expectations, and upgrade posture (semantics defined now; release tooling later).
7. **Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md** — canonical manifest fields, content enumeration expectations, and release-prep readiness criteria (semantics defined now; publication remains future work).
8. **First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md** — first concrete v0 bundle candidate include/exclude boundary optimized for downstream consumer use and prompt-template style consumption.
9. **ChatGPT_Project_00_Identity_Export_Contract_v1_0.md** — canonical export contract for the ChatGPT-project `00_Identity` zip artifact (downstream export; not a published bundle).
10. **CI_Auto_Merge_Policy_heartloom_identity_v1_0.md** — canonical required-check baseline, merge readiness criteria, auto-merge posture, and branch cleanup posture (policy defined now; implementation/settings later).
11. **Codex_Global_Source_Install_Contract_heartloom_identity_v1_0.md** — canonical source path and `~/.codex/` target mapping contract for future global Codex runtime files (explicit install posture; implementation later).
12. **Codex_Execution_Profiles_Contract_heartloom_identity_v1_0.md** — canonical execution profiles for Codex runtime behavior (safe default and GitHub/PR profile) with config vs instruction boundaries.
13. **Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md** — map of the enforcement-layer policies.
14. **Heartloom-AI-Policies/authority-boundary-map-v1.0.md** — authority ladder + “you/we” interpretation + cross-project visibility limits.
15. **Heartloom-AI-Policies/required-reference-docs.md** — always-refer docs (stable base + per-project).
16. **Heartloom-AI-Policies/heartloom-ai-operating-protocol-v1.0.md** — the canonical operating protocol (pointer files exist elsewhere; this is source-of-truth).
17. **Heartloom_AI_Memory_Constitution.md** — memory and consent rules (canonical location: Protocols root).
18. **github-governance-policy.md** + **github-repo-intake-checklist.md** — repo governance + intake workflow.
19. **Codex_CLI_Termux_Setup_v1_0.md** — Codex CLI setup and safe operation.
20. **House_Defaults_v1_0.md** + **Tools_Shortlist_v1_0.md** + **Definitions_Glossary_v1_0.md** — defaults, tools, shared language.
21. **Docs_Full_Audit_heartloom_identity_2026-04-07.md** — repo-wide documentation audit report (conflicts, drift risks, discoverability gaps).
22. **Identity_Pack_Architecture_heartloom_identity_v1_0.md** — Reference Pack vs Working Pack architecture and artifact boundary definitions.
23. **exports/chatgpt-reference-pack/README.md** — export-safe navigation for the ChatGPT Reference Pack.
24. **Identity_Layer_Output_Contract_heartloom_identity_v1_0.md** — canonical identity-layer output contract and workflow learnings.
## Maintenance triggers

- If a key term’s meaning changes (“canonical”, “drift”, “pause point”, “forensic”, “done/DoD”), update **Definitions_Glossary_v1_0.md**.
- If a workflow default changes (branch naming, CI baseline, artifact set), update **House_Defaults_v1_0.md**.
- If canon authority boundaries or install-source rules change, update **Change-Control_00_Identity_Canonical_Repo_Authority_Proposal_v1_0.md** (or its successor) in the same slice.
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
- **ChatGPT export zip (staged to vault):** `scripts/export-chatgpt-00-identity-zip.sh`
- **Stable Base reference pack zip:** `hl-zip-stable-base`
- **Protocols zip (for review):** `hl-zip-00-identity`
- **Protocols → PDF builder:** `hl-build-00-identity-protocols-pdf`

Outputs are staged to:

- `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`

Logs are written to:

- `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump`

## Current canon versions (manual quick-check)

- Stable Base pack: `Stable_Base-2026-02-12.zip`
- Protocols reading order: `00_Identity_Protocols_Reading_Order_v1_0.md`
- Protocols PDF: `00_Identity-Protocols-2026-02-12.pdf`

INDEX.md EOF
