# Full Documentation Audit: heartloom-identity (2026-04-07)

## Executive summary

Overall documentation is coherent and well-structured, with strong canonical boundaries and explicit implemented-vs-future state labeling. The main risks are workflow guidance conflicts between repo-specific AGENTS rules and global policy guidance, and missing project-level decision/drift artifacts that required-reference docs expect. A small number of discoverability and ambiguity gaps remain but do not block core operations.

## Confirmed strengths

- Clear canonical authority model is documented and consistent across core authority and installer records.
- Implemented vs future state is explicitly labeled in CI, bundle, and consumer integration docs.
- Export artifact contract clearly distinguishes repo-canonical source vs downstream artifacts.
- Repo structure aligns with documented scripts, manifests, and tooling directories.

## Conflicts / contradictions

1) **Severity: high**
- **Affected files:** `Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`, `AGENTS.md`
- **Description:** Global PR-first policy instructs the assistant to provide manual branch/PR command blocks, while repo-specific AGENTS requires a Codex-prompt-only workflow with no manual command blocks.
- **Why it matters:** Conflicting instructions can cause workflow drift and inconsistent operator expectations, especially in required-reference policy docs.
- **Recommended fix:** Add an explicit repo-specific override note in the policy doc or a cross-reference in `AGENTS.md` clarifying that heartloom-identity uses Codex-prompt-only and supersedes manual command blocks.

2) **Severity: medium**
- **Affected files:** `Heartloom-AI-Policies/github-and-codex-pr-first-policy-v1.0.md`, `AGENTS.md`
- **Description:** The policy defines a default slice loop without the newly-required PR preflight step that is now mandated in `AGENTS.md`.
- **Why it matters:** Operators following the policy doc may skip PR preflight/merge handling, leading to redundant slices or missed merge-ready PRs.
- **Recommended fix:** Add a short preflight note in the policy doc or link the repo-specific AGENTS rule as authoritative for this repo.

## Ambiguities / drift risks

1) **Severity: medium**
- **Affected files:** `Heartloom-AI-Policies/required-reference-docs.md`
- **Description:** The required project-level docs list includes “Project Decisions Snapshot” and “Project Drift Ledger,” but no matching files are present in this repo.
- **Why it matters:** This creates a persistent compliance gap and ambiguity about whether those artifacts are required for heartloom-identity or intentionally absent.
- **Recommended fix:** Either add minimal placeholder files or update the required-reference doc to explicitly note when a project does not yet maintain them.

2) **Severity: low**
- **Affected files:** `tooling/codex-global/AGENTS.md`, `AGENTS.md`
- **Description:** Global Codex defaults still mention manual command blocks and PR-first loop steps that are explicitly disallowed in this repo’s AGENTS.
- **Why it matters:** If the global AGENTS are used for bootstrapping, they can conflict with repo-specific behavior unless the override is clearly called out.
- **Recommended fix:** Add a brief compatibility note in the global AGENTS to defer to repo-local AGENTS when present.

## Stale / outdated statements

- **None confirmed.** All reviewed documents correctly distinguish implemented vs proposed state, and recent export/staging behavior is reflected in the contract/README/INDEX.

## Discoverability / index gaps

1) **Severity: low**
- **Affected files:** `INDEX.md`
- **Description:** New audit reports are not currently referenced in the index, reducing visibility for future operators.
- **Why it matters:** Audits are valuable entry points for understanding current documentation health.
- **Recommended fix:** Add a brief index entry for the audit report.

## Naming / structure inconsistencies

- **None confirmed.** Filenames follow established underscore/hyphen guidance and policy naming conventions.

## Recommended fixes (grouped by priority)

### High priority
- Resolve the conflict between repo-specific AGENTS and the global PR-first policy by adding an explicit override note in the policy doc or AGENTS.

### Medium priority
- Clarify the status of project-level decision/drift artifacts required by `Heartloom-AI-Policies/required-reference-docs.md` (add placeholders or document absence).
- Update policy docs to acknowledge the new PR preflight step mandated by repo AGENTS.

### Low priority
- Add an index entry for this audit report.
- Add a compatibility note in `tooling/codex-global/AGENTS.md` to defer to repo-local AGENTS.

## No-op / looks good findings

- Authority transition and installer validation docs are consistent and aligned with repo structure.
- Consumer integration and bundle semantics docs are internally consistent and correctly labeled as future-facing where appropriate.
- ChatGPT export contract, script, and staging behavior are aligned across docs and scripts.

Reference/Docs_Full_Audit_2026-04-07.md EOF
