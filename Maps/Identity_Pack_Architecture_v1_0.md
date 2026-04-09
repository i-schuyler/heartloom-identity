# Identity Pack Architecture: heartloom-identity (v1.0)

Status: **CANONICAL ARCHITECTURE DEFINED (no pack tooling implemented yet)**  
Type: Repo architecture boundary definition  
Scope: Reference Pack vs Working Pack, artifact boundaries, and legacy bridge posture

## Purpose

Define the architectural split between **Reference Pack** and **Working Pack** for `heartloom-identity`, clarifying canonical sources, generated artifacts, and sensitive local outputs. This document is docs-only; it does not implement pack tooling.

## Definitions

### Reference Pack

Consumer-facing, non-sensitive, canonical subset of identity/policy docs that downstream repos can pin and review. It must be:

- Minimal and stable.
- Safe to publish/share.
- Derived from repo-canonical source docs only.
- Free of generated, local, or sensitive artifacts.

### Working Pack

Operator-facing working set that may include:

- Canonical source docs.
- Generated local artifacts (build outputs, logs, staging zips).
- Sensitive local context (vault metadata, key maps, environment-specific references).

Working Pack is **not** a publishable artifact and should never be committed wholesale.

## Canonical source vs generated vs sensitive boundaries

### Canonical repo source (authoritative)

- Markdown docs in this repo are the canonical authoring source for `Heartloom Identity`.
- Changes here are the authoritative upstream baseline for exports and consumers.

### Generated local artifacts (not committed)

Examples include:

- Staged zips in `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`
- Termux log outputs under `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/`
- Build outputs (PDFs, derived indexes, temporary zips)

These are local working artifacts. They are never committed to this repo.

### Sensitive local artifacts (never committed)

Examples include:

- Vault meta docs and file trees under `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/vaultmeta/`
- Key location maps and other environment-specific secrets/metadata

These are required only when relevant and must remain local.

### Exported artifacts (downstream)

Exports (for example the ChatGPT `Heartloom Identity` zip) are **downstream snapshots** built from canonical source docs. They are **not** canonical sources themselves.

## Pack boundary expectations

- **Reference Pack** contains only canonical, consumer-facing, non-sensitive docs.
- **Working Pack** may include Reference Pack plus generated and sensitive local artifacts.
- Generated or sensitive artifacts must never be committed.
- Export artifacts must clearly declare provenance and be staged outside the repo.

## Relationship to existing artifacts

- The ChatGPT export artifact should align with **Reference Pack** scope and remain clean/minimal.
- Stable Base and other local working artifacts remain **Working Pack** outputs until a future slice defines their packaging.

## Legacy pointer/bridge docs

Legacy pointer shims currently present at repo root:

- `Policies/Heartloom_AI_Operating_Protocol.md`
- `Policies/Repo_Standards_Baseline.md`

These remain as compatibility pointers to their canonical policy versions. They are **not** part of Reference Pack content and should be treated as legacy bridges until a future deprecation/retirement slice confirms safe removal.

## Non-goals in this slice

- No Reference Pack or Working Pack export tooling implementation.
- No bundle publishing or release automation.
- No installer changes.
- No downstream repo changes.

Maps/Identity_Pack_Architecture_v1_0.md EOF
