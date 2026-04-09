# Definitions Glossary v1.0
*Shared language for HeartloomVault collaboration, drift prevention, and project execution.*

- Document type: Glossary (human-editable)
- Last updated (local): 2026-01-27

---

## Purpose

This glossary defines terms used across HeartloomVault work and GitHub-related development. It exists to reduce semantic ambiguity and prevent drift.

---

## Authority and canon

- **Canonical:** The current source of truth for a project. Canonical sources override non-canonical notes and prior assumptions.
- **Canonical Documentation Index:** The document that defines authority and reading order for a project’s docs. It is the map for “what to read first.”
- **Decisions Snapshot:** Append-only record of decisions actually made. It exists to prevent re-litigating settled choices.

---

## Drift and integrity

- **No Silent Drift:** Drift risks are surfaced before proceeding. Work should not continue “as best as possible” when authority is unclear or a parallel stack is forming.
- **Drift:** Any untracked divergence that increases re-entry cost or breaks authority alignment, including parallel stacks, doc/code divergence, unclear authority, silent behavior changes, or build artifacts creeping into zips/commits.
- **Drift Ledger:** A log of drift risks and their resolution/deferral status, kept separate from audit logs.

---

## Assumptions and ambiguity

- **No silent assumptions:** Assumptions are either clarified with the user (when blocking/safety-relevant) or explicitly labeled (when safe to proceed).
- **Blocking ambiguity:** Missing information that prevents correct/safe work. Requires a clarifying question.
- **Non-blocking ambiguity:** Missing information that can be defaulted safely. Proceed with the smallest safe assumption, explicitly labeled.
- **Assumptions Registry:** Where unavoidable assumptions live (especially for hardware/security). Unknowns are treated as disabled/safe until confirmed.

---

## Execution scaffolding

- **Operating mode:** One of Exploration, Dev, Integration, Pause. Modes should not be mixed without an explicit transition.
- **Pause point:** A deliberate stop where repo integrity is preserved and a clean re-entry path is recorded.
- **Re-entry hint:** One or two sentences telling future-you where to start and what state to be in.
- **Stop conditions:** Conditions that force a hard pause (e.g., missing required docs, ambiguous milestone scope, irreversible actions without explicit confirmation, secret leakage risk, evidence/log integrity risk, parallel stacks).

---

## Artifacts and packaging

- **Artifact Contract:** The checklist for zip or downloadable handoffs (root preserved, dotfiles included in trees, build artifacts excluded, touched-files list, schema/API diffs when applicable, re-entry hint).
- **Touched files list:** A list of changed files, ideally separated into Added vs Modified.

---

## Depth and inspection

- **Standard comprehensive depth:** High-fidelity inspection by default for zips/large docs/PDFs; includes dotfiles; avoids lossy/truncated views; cross-checks when something seems missing.
- **Forensic depth:** Maximum scrutiny used for security-sensitive work, suspected drift, missing files, schema/API changes, or when explicitly requested.

---

## Data and schema discipline

- **Append-only:** Add fields/entries without renaming/removing old ones (preserves backward compatibility and evidence).
- **Forward-only migration:** A migration that can move older data/config forward without wiping. Migrations are logged.

---

## Offline-first

- **Offline-first:** A system is expected to work without cloud dependency; cloud may be used only as allowed by project canon (e.g., backup, not live sync).
