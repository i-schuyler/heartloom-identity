# Identity Maintenance Triggers (v1.0)
Status: PROPOSED

This checklist defines “when you must update which Identity docs/tools” to prevent drift across projects.

---

## Trigger → Required updates

### 1) Canonical paths change (vault, staging, logs, drop-folders)
Update:
- `Heartloom-Identity/INDEX.md` (navigation + canonical paths)
- `Heartloom-Identity/Heartloom-AI-Policies/termux-and-shell-policy-v1.0.md`
- Any Termux scripts that embed paths (`~/bin/hl-*`)
- Stable Base pack (if it includes the affected reference)

### 2) New “always-refer” doc is created
Update:
- `Heartloom-Identity/Heartloom-AI-Policies/required-reference-docs.md`
- Stable Base pack list (if it’s a stable cross-project reference)

### 3) New policy doc (v1.x) is added under Heartloom-AI-Policies
Update:
- `Heartloom-Identity/Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md`
- `Heartloom-Identity/INDEX.md` if it changes “Start here” ordering

### 4) Prompt template semantics change (“you/we”, hard stops, artifact contract)
Update:
- `Heartloom-Identity/PROMPT - Template.md`
- `Heartloom-Identity/Heartloom-AI-Policies/authority-boundary-map-v1.0.md` (if semantics are global)

### 5) GitHub/Codex workflow changes (PR-first, CI loop, branch policy)
Update:
- `Heartloom-Identity/Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`
- Any “repo intake” or “governance” docs that restate the workflow

### 6) Termux automation script added/changed
Update:
- `30_REFERENCE/70_Termux/TERMUX_PROJECTS_README.md`
- Add a `*_run-instructions.md` next to it (recommended)
- Consider adding to Stable Base pack if it’s foundational

### 7) You ship a new “Identity artifact” (zip/PDF) intended for reuse
Run:
- `hl-build-identity-artifacts` (preferred) OR
- `hl-zip-stable-base` and current canonical artifact commands from `30_REFERENCE/70_Termux/TERMUX_PROJECTS_README.md`

Then:
- verify outputs in `40_STAGING/`
- verify logs in `log-dump/YYYY-MM-DD/`

---

## Notes
- This document is a “maintenance router.” It does not define canon by itself.
- Keep it short; prefer links to canonical sources.

---

Checklists/Identity_Maintenance_Triggers_v1_0.md EOF
