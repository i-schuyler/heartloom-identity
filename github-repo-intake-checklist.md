# GitHub Repo Intake Checklist
Location: `Heartloom-Identity/`

## Purpose
This checklist is completed before creating a new GitHub repository (or when adopting an existing repo). It prevents drift and forces explicit decisions on governance, secrets, CI spend, and safety boundaries.

## Quick use instructions
- Complete Sections A–E.
- If the repo is safety-critical, also complete Section F (Safety Appendix requirement).
- Store the completed answers in the repo under `docs/` (recommended) or in the vault as a project note.

---

## A) Identity and intent
- Repo name:
- Owner (personal user vs org):
- Public or private (initial):
- One-sentence purpose:
- “Definition of Done” for initial setup (what makes the repo “ready”):

## B) Default branch policy
- Default branch name:
- Enforcement level (0/1/2):
- PR required for merges? (yes/no)
- CI required before merge? (yes/no)
- Who can merge? (self only / specific users):

## C) Secrets and boundary
- Does the project touch credentials, OTA, auth, or key material? (yes/no)
- Where will secrets live? (password manager / GitHub Secrets / other)
- What must never be logged?
- What should be redacted in docs?

## D) CI plan and spend policy
- CI goal: build-only OR build+publish
- Triggers: pull_request only / also on push / scheduled
- Target spend: $0 (confirm)
- What constitutes a “required” check?

## E) Release contract
- Release model: manual tags / auto on merge / hybrid
- Versioning scheme (semver or other):
- Artifact naming pattern:
- Required release metadata:
  - checksums
  - toolchain version
  - commit SHA
  - release notes

## F) Safety Appendix (required for safety-critical repos)
If the repo is safety-critical (EV control, access control, device firmware):
- Create `docs/safety-appendix.md` using the required headings:
  1) Public surface area
  2) Threat model (lightweight)
  3) Safety invariants + fail-safe defaults
  4) Logging policy (what is NOT logged)
  5) Update/OTA policy

## G) Post-create “best effort apply” (for existing repos)
When applying this checklist to an existing repo:
- Answer A–F best effort.
- Record unknowns explicitly.
- Create missing docs stubs rather than guessing.
