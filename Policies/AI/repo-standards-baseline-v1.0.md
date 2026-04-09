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
- `Scripts/` — developer automation scripts
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
