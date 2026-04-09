# Repo Standards Baseline (v1.0)

## Purpose

This baseline defines a default repo structure and lightweight quality tripwires. If a project’s canonical docs specify a different structure, the project docs override.

## Naming convention

Naming convention (scoped)
• GitHub repos + repo-matching folder titles: prefer hyphens (CLI/web friendly).
• Vault / Heartloom Identity docs: prefer stability over renaming; underscores are acceptable/preferred where already in use.
• Em dash —: use in human-facing titles/headings, not filenames.

## Baseline repo structure

Repo root should include:

- `README.md`
- `LICENSE` (or `COPYING`)
- `.gitignore`
- `.editorconfig`
- `.github/` (workflows/templates as appropriate)

Recommended folders (as applicable):

- `docs/` — canonical documentation hub
  - Canonical Documentation Index
  - Decisions Snapshot (append-only)
  - Drift Ledger
  - Assumptions Registry (hardware/security projects)
  - Milestone audit logs (e.g., `Audit_Log_M6.md`)
  - Configuration Registry
  - Event Log Schema
  - Integration Points Map
  - Bench Test Checklist
  - Troubleshooting
  - Release channels / stability promise

- `src/` — production code
- `data/` — embedded runtime assets (when applicable)
- `scripts/` — developer automation scripts
- `tools/` — one-off utilities not shipped to devices
- `tests/` — unit/integration tests (when present/allowed)

Optional: `examples/`, `ci/`, `third_party/` (vendored deps + licenses), `assets/` (docs images / non-runtime)

## Packaging discipline

- Do not commit/include large build artifacts in zips/commits (e.g., `.pio/build`, `node_modules`, `dist`).
- Preserve repo root structure for zip-tennis workflows.

## Minimal CI tripwire (where feasible)

- Build and/or lint/syntax checks
- Forbidden-artifact checks (e.g., `.pio/build`, `node_modules`, `dist`)
- Presence checks for required docs (canonical index + decisions snapshot at minimum)

## Early-stage public posture (recommended)

- Keep repos public read-only/low attention early on.
- Use PRs for self/AI workflow but do not accept external PRs until later.

---

## Appendix A — Legacy repo standards baseline merged (verbatim snapshot)

> Source: `Heartloom-Identity/Policies/Repo_Standards_Baseline.md` (pre-merge). Included to ensure no loss.

# Repo Standards Baseline
*Vault-level reference for repository structure, documentation canon, and artifact discipline.*

- Document type: Standards baseline (human-editable)
- Default stance: Highest Trust (Critical / Sacred)
- Last updated (local): 2026-01-26

---

## Purpose

This document defines a baseline repository structure and working discipline used across HeartloomVault-related development. It exists to reduce drift, lower re-entry cost, and make collaboration reproducible.

Authority rule: if a project’s canonical documentation specifies different structure or rules, the project’s canon overrides this baseline.

---

## Default workflow standard (GitHub work)

For GitHub-related implementation and development work, the default standard is:

- Codex CLI + GitHub CI as the primary workflow
- Zip-based handoffs as a fallback when required or explicitly chosen

---

## Baseline repository structure

### Repo root (required)
- README.md
- LICENSE (or COPYING)
- .gitignore
- .editorconfig
- .github/ (CI workflows + templates as needed)

### docs/ (canonical truth hub)
docs/ is the authoritative documentation hub and should contain, as applicable:
- Canonical_Documentation_Index_vX_Y.md (reading order + authority)
- Decisions_Snapshot.md (append-only)
- Drift_Ledger.md
- Assumptions_Registry.md (hardware/security)
- Integration_Points_Map.md
- Configuration_Registry_vX_Y.md
- Event_Log_Schema_vX_Y.md
- Bench_Test_Checklist_vX_Y.md
- Troubleshooting_vX_Y.md
- Release_Channels_and_Stability_Promise.md
- Audit_Log_Mx.md (milestone/session logs, as used)

### src/ (production code)
- Production code is organized into coherent modules.
- Existing module folders are extended; parallel stacks are avoided unless canon requires them.

### data/ (embedded runtime assets, when applicable)
- Embedded runtime assets (e.g., SPA files served from flash).
- External asset dependencies are avoided unless canon explicitly allows them.

### scripts/ (developer automation)
- Build helpers, lint, packaging, release helpers.

### tools/ (non-shipping utilities)
- One-off tools and local utilities that should not ship to devices.

### tests/ (when present/allowed)
- Unit/integration tests when feasible and allowed by project constraints.

### Optional folders (when needed)
- examples/
- ci/
- third_party/ (vendored deps with licenses)
- assets/ (non-runtime assets such as docs images)

---

## Naming and versioning conventions

Preferred conventions:
- Canonical docs: Thing_v1_0.md
- Milestone audit logs: Audit_Log_M6.md (or Audit_Log_Mx.md)
- Decisions snapshot: Decisions_Snapshot.md (append-only)
- Drift ledger: Drift_Ledger.md
- Assumptions registry: Assumptions_Registry.md

---

## Canonical discipline rules

### Canonical-docs-first
- Canonical documentation is treated as the source of truth.
- Documentation is read before coding.
- Implementation follows canon exactly unless the user overrides.

### No Silent Drift
The assistant should stop and surface drift risks before proceeding, including:
- duplicate stacks / parallel modules
- unclear authority
- doc/code divergence
- unstated assumptions
- scope creep

### Config + schema discipline
- Schema version constants are maintained.
- Changes are append-only when possible.
- Migrations are forward-only.
- No silent wipes/resets.
- Migrations are logged as events.

---

## Minimal CI tripwire (recommended)

Where feasible, CI should include:
- build and/or lint checks
- forbidden-artifact checks (e.g., .pio/build, node_modules, dist)
- presence checks for required docs (index/decisions/drift/assumptions as applicable)

The goal is drift detection, not bureaucracy.

---

## Zip handoff “Artifact Contract” (when zips are used)

When delivering a zip artifact:
- Repo root and layout are preserved.
- File trees include dotfiles.
- Large build artifacts are excluded (e.g., .pio/build, .pio/libdeps, node_modules, dist).
- A touched files list is provided (Added vs Modified).
- Schema/API diffs are included when applicable (append-only).
- A re-entry hint is included.

If expected files are missing after unzip/tree:
- Rebuild the file tree using a different method.
- If still missing, stop and report what is missing (do not guess).

---

## Recommended micro-artifacts and how to use them

### Decisions_Snapshot.md (append-only)
Records decisions actually made (no maybes). This is the fastest way to reduce re-entry cost.

### Drift_Ledger.md (separate from audit logs)
Records drift risks and whether they were resolved or deferred.

### Assumptions_Registry.md (hardware/security)
Tracks unavoidable assumptions. Unknowns are treated as disabled/safe until confirmed.

### Integration_Points_Map.md
Lists authoritative integration points (status builder, config store, logger, state machine, admin gating, scheduler) to prevent parallel logic.

---

## Suggested vault locations

Vault-level repo standards reference:
- /storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/Policies/Repo_Standards_Baseline.md

Canonical Termux outputs:
- /storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/
