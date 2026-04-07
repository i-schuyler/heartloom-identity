# Protocols Index
*Canonical navigation for HeartloomVault’s meta-layer.*

## Recommended reading order

Primary reading order is defined by the manifest:

- **`00_Identity_Protocols_Reading_Order_v1_0.md`** — canonical Protocols reading order for the PDF build.

If you want a short “start here” sequence:

1. **README.md** — what this folder is and what belongs here.
2. **Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md** — map of the enforcement-layer policies.
3. **Heartloom-AI-Policies/authority-boundary-map-v1.0.md** — authority ladder + “you/we” interpretation + cross-project visibility limits.
4. **Heartloom-AI-Policies/required-reference-docs.md** — always-refer docs (stable base + per-project).
5. **Heartloom-AI-Policies/heartloom-ai-operating-protocol-v1.0.md** — the canonical operating protocol (pointer files exist elsewhere; this is source-of-truth).
6. **Heartloom_AI_Memory_Constitution.md** — memory and consent rules (canonical location: Protocols root).
7. **github-governance-policy.md** + **github-repo-intake-checklist.md** — repo governance + intake workflow.
8. **Codex_CLI_Termux_Setup_v1_0.md** — Codex CLI setup and safe operation.
9. **House_Defaults_v1_0.md** + **Tools_Shortlist_v1_0.md** + **Definitions_Glossary_v1_0.md** — defaults, tools, shared language.
## Maintenance triggers

- If a key term’s meaning changes (“canonical”, “drift”, “pause point”, “forensic”, “done/DoD”), update **Definitions_Glossary_v1_0.md**.
- If a workflow default changes (branch naming, CI baseline, artifact set), update **House_Defaults_v1_0.md**.
- If a new protocol doc is added, link it here in the appropriate place.

## Run tools (phone-first)

These are Termux helpers that support “ZIP-TENNIS” review and final identity artifacts:

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
