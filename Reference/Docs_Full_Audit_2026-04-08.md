# Full Documentation Audit: heartloom-identity (2026-04-08)

Status: **FULL REPO DOC AUDIT COMPLETED (diagnosis only; no broad cleanup applied)**  
Type: Repo-wide documentation redundancy/conflict/staleness audit  
Scope: Canon navigation, policy/canon cohesion, stale terminology/path assumptions, supersession and cleanup candidates

## Purpose

Provide an evidence-based full documentation audit to identify:

- Redundant docs or repeated guidance.
- Conflicting docs and ambiguity points.
- Stale terminology/path assumptions.
- Partially superseded docs that should be archived/simplified.
- Useful docs that should remain unchanged.

This slice is diagnosis-first and does not implement broad cleanup/deletion.

## Scope and NOT in this slice

### Scope

- Repo-wide markdown documentation review (`README`, `INDEX`, `Maps`, `Contracts`, `Checklists`, `Policies`, `Reference`, `Change_Control`, `Exports`).
- Evidence-grounded findings with urgency and practical cleanup recommendations.

### NOT in this slice

- No broad doc removals, merges, or archive moves.
- No policy authority rewrites.
- No installer/CI/tooling behavior changes.

## Evidence Block

- Repo-specific workflow authority in `AGENTS.md` requires Codex-prompt-only behavior and preflight-first execution.
- Canon map/navigation and identity contracts are present and internally coherent for source-alignment boundaries.
- Multiple policy/reference files intentionally preserve legacy snapshots, but some preserved text now conflicts with active repo workflow behavior.
- Several docs reference external vault artifacts or placeholder project docs that are not present in this repo, creating ambiguity if interpreted as hard requirements.

## Audit findings

### F-01

- Files: `AGENTS.md`; `Policies/AI/github-and-codex-pr-first-policy-v1.0.md`
- Issue type: **Conflict (workflow contract)**
- Why it matters: Repo canon says no manual branch/push/PR command blocks in assistant prompts, while policy v1.0 default loop explicitly requires those command blocks.
- Recommended action: Add a repo-specific override section in `github-and-codex-pr-first-policy-v1.0.md` (or split global vs repo-local mode) so heartloom-identity behavior is unambiguous.
- Urgency: **high**

### F-02

- Files: `AGENTS.md`; `Policies/AI/github-and-codex-pr-first-policy-v1.0.md`
- Issue type: **Conflict (workflow sequencing)**
- Why it matters: Repo canon requires PR preflight and auto-merge attempt in each run; policy v1.0 slice loop omits this sequencing, increasing risk of stale/duplicate PR flow.
- Recommended action: Update policy workflow loop to include preflight + auto-merge attempt, or explicitly defer to repo-local `AGENTS.md` sequencing when present.
- Urgency: **high**

### F-03

- Files: `AGENTS.md`; `Policies/AI/required-reference-docs.md`
- Issue type: **Conflict / ambiguity (output style vs command emission)**
- Why it matters: Required-reference rule asks assistant to provide exact regeneration commands whenever covered docs change, while repo `AGENTS.md` forbids manual command blocks in assistant prompts for this repo.
- Recommended action: Add context gating in `required-reference-docs.md` (e.g., "command emission required for manual workflow contexts; repo-local Codex-run repos may execute directly").
- Urgency: **high**

### F-04

- Files: `INDEX.md`; `README.md`; `Maps/Heartloom_Identity_Protocols_Reading_Order_v1_0.md`
- Issue type: **Redundancy (onboarding/navigation overlap)**
- Why it matters: Newcomer reading order appears in multiple near-duplicate forms, increasing maintenance overhead and rewording drift risk.
- Recommended action: Keep one primary newcomer sequence (`README` or `INDEX`), and make other docs point to it rather than restating.
- Urgency: **medium**

### F-05

- Files: `Policies/AI/heartloom-ai-operating-protocol-v1.0.md`
- Issue type: **Partially superseded (legacy appendix mixes active+archival guidance)**
- Why it matters: Appendix A preserves legacy text that contains old formatting/workflow defaults, which can be misread as active policy.
- Recommended action: Mark Appendix A explicitly as archival/non-normative at section entry, or move it to a dedicated archive doc and keep a short historical pointer.
- Urgency: **medium**

### F-06

- Files: `Policies/AI/repo-standards-baseline-v1.0.md`
- Issue type: **Redundancy / clutter (verbatim legacy snapshot appendix)**
- Why it matters: Large in-file legacy appendix duplicates baseline content and makes active guidance harder to scan on mobile.
- Recommended action: Keep the active v1.0 baseline concise; move legacy full snapshot to archive/reference-only file.
- Urgency: **medium**

### F-07

- Files: `Checklists/Identity_Maintenance_Triggers_v1_0.md`
- Issue type: **Stale path/tool assumptions**
- Why it matters: Checklist references repo-external or currently absent artifacts (`PROMPT - Template.md`, `hl-build-identity-artifacts`, external Termux README path), which can cause false maintenance obligations.
- Recommended action: Add explicit "vault-external" labeling for those entries and/or replace with currently maintained in-repo equivalents.
- Urgency: **medium**

### F-08

- Files: `Policies/AI/authority-boundary-map-v1.0.md`
- Issue type: **Stale unresolved note**
- Why it matters: "Known current mismatch" section still points to `PROMPT - Template.md` update target, but that target is not present in this repo, making the fix path ambiguous.
- Recommended action: Refresh mismatch note with valid current targets or mark as external-vault follow-up.
- Urgency: **medium**

### F-09

- Files: `Policies/AI/required-reference-docs.md`
- Issue type: **Ambiguity (hard-required vs not-adopted project artifacts)**
- Why it matters: Project-level required docs include generic items (canonical index, decisions snapshot, drift ledger, assumptions registry) that may not exist in every repo; this can force unnecessary STOP conditions.
- Recommended action: Keep the requirement, but add explicit adoption-state handling (required-if-adopted vs missing-by-design).
- Urgency: **medium**

### F-10

- Files: `README.md`
- Issue type: **Potentially stale operational note**
- Why it matters: "Codex push/PR smoke test note" reads like one-time validation residue and adds non-canonical noise to the primary entrypoint.
- Recommended action: Move smoke-test notes to change-control/audit log context and keep README focused on enduring navigation.
- Urgency: **low**

### F-11

- Files: `Policies/AI/global-memories-refactored-set-v2.0.md`
- Issue type: **Cross-project clutter**
- Why it matters: Project-specific memory entries (for unrelated repos/devices) reduce signal for heartloom-identity-focused operators.
- Recommended action: Move project-specific items to project overlays and keep this file scoped to stable cross-project anchors.
- Urgency: **low**

### F-12

- Files: `Policies/Heartloom_AI_Operating_Protocol.md`; `Policies/Repo_Standards_Baseline.md`
- Issue type: **Useful compatibility shims (not a bug)**
- Why it matters: Pointer shims are intentionally present for compatibility and currently reduce breakage risk.
- Recommended action: Leave as-is for now; retire only after link-impact audit and explicit deprecation slice.
- Urgency: **low**

## Docs that should remain unchanged (current posture)

- `Contracts/Source_Alignment_Contract_v1_0.md` — clear upstream/downstream authority boundary and drift routing.
- `Checklists/Alignment_Review_Checklist_v1_0.md` — concise anti-drift review flow aligned with contract language.
- `Reference/Distinctions_Library_v1_0.md` — high-signal reusable vocabulary with good scope boundaries.
- `Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md` — clear source vs export artifact boundary and explicit include/exclude semantics.

## Recommended cleanup priorities (next slices)

1. **High:** Resolve workflow-policy conflicts (`AGENTS.md` vs PR-first/required-reference command-emission language).
2. **Medium:** Normalize onboarding/navigation to one primary newcomer sequence and one deep index.
3. **Medium:** Archive/separate large legacy appendices from active policy docs.
4. **Medium:** Clarify stale external-path assumptions in maintenance/authority docs.
5. **Low:** Trim one-off operational residue and cross-project memory clutter from repo-primary docs.

## Hard Stop Conditions

- STOP if a cleanup proposal cannot cite concrete conflicting text.
- STOP if a recommendation would change canonical meaning/authority instead of documentation structure.
- STOP instead of deleting docs in a diagnosis-only slice.

Reference/Docs_Full_Audit_2026-04-08.md EOF
