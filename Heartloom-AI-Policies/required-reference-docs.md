# Required Reference Docs (v1.0)

> Purpose: This is the single canonical list of “always-refer” documents.
> Rule: If the assistant cannot read the contents of any required document **verbatim** before responding to a request that depends on it, the assistant must **STOP** and ask the user to upload that document into the chat (or otherwise provide its contents).

## Session Input Artifacts (zips)

These are **reference pack artifacts** and are generally expected to be present in Project Files:

- **00_Identity.zip** (e.g., `00_Identity-YYYY-MM-DD.zip`) — Reference Pack snapshot
- **Stable_Base.zip** (also referred to as **Canonical Reference.zip**) — Reference Pack snapshot

### Universal STOP rule (applies to all required artifacts)
If the assistant references any required artifact (doc/zip) that is not available in the current session inputs, the assistant must **STOP** and request that artifact (no guessing, no proceeding).

### Ongoing regeneration rule (assistant obligation)
Whenever the assistant proposes edits to any document covered by this required list (including prompt templates and policies), the assistant must also provide the exact commands to regenerate updated session packs (00_Identity.zip and Stable_Base.zip) and stage them into `40_STAGING/` for upload/review.

## A) Canonical in-repo policy docs (this folder)

These are always required for ongoing collaboration behavior:

- heartloom-ai-policy-index-v1.0.md
- heartloom-ai-operating-protocol-v1.0.md
- termux-and-shell-policy-v1.0.md
- github-and-codex-pr-first-policy-v1.0.md
- repo-standards-baseline-v1.0.md
- zip-inspection-and-artifact-contract-v1.0.md
- global-memories-refactored-set-v2.0.md
- required-reference-docs.md

## A2) Canonical in-repo identity docs (repo root)

- Heartloom_AI_Operating_Protocol.md (pointer to canonical policy)
- Heartloom_AI_Memory_Constitution.md
- Definitions_Glossary_v1_0.md
- github-governance-policy.md
- github-repo-intake-checklist.md
- Repo_Standards_Baseline.md (pointer to canonical policy)

## B) Generated local working artifacts (vault-level, when present)

These are working-pack inputs that may be sensitive or environment-specific. They are **not** committed to this repo and may include Stable Base / Working Pack outputs.

- /storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/GitHub_SSH_Key_Locations_Map_AUTHORITATIVE.md
- /storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/vaultmeta/VaultMeta - File Tree.md
- /storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/vaultmeta/VaultMeta - Directory Blocks.md
- /storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/70_Termux/TERMUX_PROJECTS_README.md
- /storage/emulated/0/Documents/HeartloomVault/00_Identity/Heartloom_AI_Operating_Protocol.md
- /storage/emulated/0/Documents/HeartloomVault/00_Identity/Heartloom_AI_Memory_Constitution.md
- /storage/emulated/0/Documents/HeartloomVault/00_Identity/Definitions_Glossary_v1_0.md
- /storage/emulated/0/Documents/HeartloomVault/00_Identity/github-governance-policy.md
- /storage/emulated/0/Documents/HeartloomVault/00_Identity/github-repo-intake-checklist.md
- /storage/emulated/0/Documents/HeartloomVault/00_Identity/Repo_Standards_Baseline.md

## C) Project-level always-refer documents (repo-local when adopted)

For any active repo/project, these are required when doing implementation work:

- Project Canonical Documentation Index
- Heartloom-AI-Policies/authority-boundary-map-v1.0.md
- Project Decisions Snapshot (append-only)
- Project Drift Ledger (if present / required)
- Project Assumptions Registry (hardware/security projects)

If any of these are missing, the assistant should hard-pause and request the relevant project files/docs, or explicitly note that the project has not adopted them yet.

## D) Stable Base (cross-project, rarely changes)

These are the “always-refer” docs that apply to every project/session.

- `00_Identity/Heartloom-AI-Policies/authority-boundary-map-v1.0.md`
- `00_Identity/Heartloom-AI-Policies/required-reference-docs.md`
- `00_Identity/Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md`

- `30_REFERENCE/GitHub_SSH_Key_Locations_Map_AUTHORITATIVE.md`
- `30_REFERENCE/vaultmeta/VaultMeta - File Tree.md`
- `30_REFERENCE/vaultmeta/VaultMeta - Directory Blocks.md`
- `30_REFERENCE/70_Termux/TERMUX_PROJECTS_README.md`
- `30_REFERENCE/70_Termux/hl-zip-00-identity_README.md`
- `30_REFERENCE/70_Termux/hl-zip-stable-base_run-instructions.md`
- `30_REFERENCE/70_Termux/hl-build-00-identity-protocols-pdf_run-instructions.md`

Optional (still stable, but not always necessary every session):
- `00_Identity/Repo_Standards_Baseline.md`
- `00_Identity/Definitions_Glossary_v1_0.md`
