# Stable Base + Working Pack Contract: heartloom-identity (v1.0)

Status: **CANONICAL CONTRACT DEFINED (implementation not yet built)**  
Type: Working Pack and Stable Base architecture contract  
Scope: Defines Working Pack purpose, boundaries, artifact classes, and external dependencies

## Purpose

Define the Stable Base / Working Pack contract for `heartloom-identity` and clarify how local/generated/sensitive artifacts relate to the canonical source and Reference Pack.

This document is docs-only and does **not** implement pack generation.

## Reference Pack vs Working Pack (recap)

- **Reference Pack:** clean, consumer-facing, non-sensitive, canonical subset of docs for downstream pinning.
- **Working Pack:** operator-facing working set that may include local/generated/sensitive artifacts used for operations and internal context.

Working Pack is **not** a publishable bundle and must not be treated as a consumer-ready artifact.

## Stable Base posture

Stable Base is treated as a **Working Pack artifact**:

- It can depend on local generated outputs.
- It may contain sensitive, path-aware, or environment-specific context.
- It must never be committed to this repo.

## Artifact classes (explicit)

### A) Canonical in-repo source docs (authoritative)

- Markdown docs maintained in `heartloom-identity`.
- These are the upstream source for Reference Pack and Working Pack content.

### B) Generated local working artifacts (local-only)

Examples:

- Staged zips in `/storage/emulated/0/Documents/HeartloomVault/40_STAGING/`
- Termux logs under `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/`
- Derived indexes or build outputs (PDFs, temporary manifests)

### C) Sensitive local artifacts (never committed)

Examples:

- Vault metadata and file trees
- Key location maps and environment-specific secrets

### D) Staged local artifacts (never committed)

Artifacts staged for review or upload (for example, Stable Base zips) are local-only outputs and must not be committed.

### E) Downstream exported artifacts (consumer-facing)

Exports like the ChatGPT Reference Pack are downstream artifacts and **not** canonical source.

## External/generated dependencies

Working Pack generation may depend on external/generated inputs such as:

- `heartloom-vaultmeta` outputs (vault file trees, directory blocks, or metadata snapshots)

These dependencies are **inputs** to Working Pack generation, not canonical source docs.

This slice documents the dependency direction without implementing adoption.

## What belongs in the repo vs local-only

**Allowed in repo:**

- Contracts, manifests, scripts, and documentation describing Working Pack/Stable Base behavior.
- Export scripts and manifests that generate local artifacts.

**Never committed:**

- Generated Working Pack outputs
- Stable Base zips or other staged artifacts
- Sensitive local metadata and environment-specific files

## Downstream order (future direction)

1) ChatGPT Reference Pack (already cleaned up)  
2) Stable Base / Working Pack contract (this document)  
3) `heartloom-vaultmeta` as first structurally meaningful downstream repo  
4) `termux-utils` after that

## Non-goals in this slice

- No Working Pack or Stable Base generation implementation.
- No downstream repo adoption.
- No installer or CI changes.

Contracts/Stable_Base_Working_Pack_Contract_v1_0.md EOF
