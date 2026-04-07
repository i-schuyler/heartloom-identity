# House Defaults v1.0
*Default collaboration and implementation conventions across HeartloomVault and related GitHub projects.*

- Document type: Defaults (human-editable)
- Last updated (local): 2026-01-27

---

## Purpose

This note captures “house defaults” used to reduce ambiguity and decision fatigue. Defaults apply unless a project’s canonical documentation or the user’s explicit session instruction overrides them.

---

## Operating defaults

- **Default mode:** Highest Trust (Critical / Sacred).
- **Assumption discipline:** No silent assumptions. Ask for clarification only when ambiguity is blocking or safety-relevant. Otherwise proceed with the smallest safe assumption, explicitly labeled.
- **Drift discipline:** No Silent Drift. Drift risks are surfaced before proceeding.

---

## GitHub development defaults

- **Default workflow:** Codex CLI + GitHub CI for GitHub-related development. Zip-based handoffs are a fallback when required or explicitly chosen.
- **Default branch:** `main`.
- **Branch naming:**
  - `feat/<short-kebab>` — feature work
  - `fix/<short-kebab>` — bugfixes
  - `docs/<short-kebab>` — documentation-only
  - `chore/<short-kebab>` — maintenance, tooling, cleanup
- **Commit messages:** imperative, present tense; optional lightweight type prefix:
  - `feat: …`, `fix: …`, `docs: …`, `chore: …`
- **PR preference:** small, reviewable diffs; avoid large reorganizations unless explicitly requested.

---

## CI “tripwire” baseline (recommended)

Where feasible, CI should include:
- build and/or lint/syntax checks appropriate to the project,
- forbidden-artifact checks (e.g., `.pio/build`, `node_modules`, `dist`),
- required-doc presence checks (Canonical Documentation Index + Decisions Snapshot at minimum).

The goal is drift detection, not bureaucracy.

---

## Repository structure default

Unless project canon specifies otherwise, repos follow the baseline stored in the Repo Standards Baseline note:
- required root files (README, LICENSE/COPYING, .gitignore, .editorconfig, .github/)
- `/docs` as canonical truth hub
- `/src` for production code modules
- avoid parallel stacks; extend existing modules

---

## Documentation defaults

- **Docs voice:** third-person narrative by default.
- **Prompts voice:** first-person “I/You” narrative by default (creating new prompts and editing existing prompts).
- **README edits (milestone work):** append-only unless explicitly allowed to reorganize.
- **Decisions Snapshot:** append-only; include only decisions actually made (no speculation).

---

## Audit log defaults

- **Audit log files:** per milestone/session (e.g., `/docs/Audit_Log.md`).
- **Structure:** append internal milestone headings/results as needed.
- **Versioning:** do not version audit logs unless necessary.

---

## Versioning standard (canonical)

Semantic versioning is used where versioning is appropriate:

- Format: `v[major].[minor].[patch]`
- Major (e.g., v2.0.0): fundamental system change (new core system, architecture shift, redesign)
- Minor (e.g., v1.2.0): significant feature or domain addition (new ritual, tag family, structural feature)
- Patch (e.g., v1.1.1): small refinement or bug fix (naming tweaks, formatting updates)

---

## Configuration and schema discipline (esp. device/security work)

- Prefer append-only changes to JSON/status/config fields.
- Use forward-only migrations; no silent wipes/resets.
- Track schema version constants when applicable (config/log/status).
- For hardware/security: unknown assumptions are treated as disabled/safe until confirmed and tracked in the Assumptions Registry.

---

## Security and secret hygiene defaults

- Do not paste secrets into chat, logs, or repos.
- Avoid logging credentials or tokens.
- Prefer CI secret scanning where feasible (e.g., gitleaks/trufflehog).

---

## Artifact defaults (downloadables)

When producing downloadable artifacts, include by default:
- suggested canonical destination path, and
- a Termux move command (mkdir -p + mv) from Downloads to the destination.

For large inspections (zips/docs/PDFs), prefer high-fidelity verification and put bulk detail into artifacts (trees/manifests/diffs) rather than walls of text.
