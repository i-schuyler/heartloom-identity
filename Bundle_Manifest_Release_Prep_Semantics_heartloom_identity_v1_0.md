# Bundle Manifest + Release-Prep Semantics: heartloom-identity (v1.0)

Status: **CANONICAL SEMANTICS DEFINED (bundle publishing/tooling not implemented)**  
Type: Consumer-facing manifest concept and release-readiness semantics  
Scope: What a future bundle manifest must communicate and when a bundle is considered ready to publish

## Purpose

Define a minimal, stable manifest concept for future `heartloom-identity` bundles and the release-prep semantics required before any bundle publication.

This document defines contract semantics only. It does **not** implement release automation, bundle generation tooling, CI checks, or installer changes.

## Implemented vs future state (required clarity)

- **Implemented now:** bundle boundary/versioning semantics are defined in `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md`.
- **Implemented now:** near-term downstream consumption still uses installer-managed local snapshots.
- **Defined now for future use:** manifest structure and release-prep readiness semantics in this document.
- **Not implemented yet:** official published bundles, manifest generation tooling, and release pipelines.

## What the future bundle manifest is for

The future manifest is a human-readable bundle contract companion that lets consumers quickly answer:

- Which bundle/version they are consuming.
- Which upstream repo state it came from.
- What is intentionally included and excluded.
- Which consumers/use-cases the bundle is intended for.
- Any compatibility notes, warnings, or usage constraints.

## Minimal manifest fields (required baseline)

At minimum, a future manifest should contain:

- `bundle_name`
- `bundle_version`
- `source_repo`
- `source_ref` (tag/commit used for the bundle)
- `release_date`
- `included_paths_or_categories`
- `exclusions`
- `intended_consumers_or_compatibility`
- `notes_or_warnings`

These fields are intentionally minimal and stable; additional fields should be added only when they improve consumer clarity.

## Minimal human-readable manifest shape (example)

```yaml
bundle_name: heartloom-identity-consumer-docs
bundle_version: vX.Y.Z
source_repo: heartloom-identity
source_ref: <tag-or-commit>
release_date: YYYY-MM-DD
included_paths_or_categories:
  - README.md
  - INDEX.md
  - Consumer_Integration_Model_heartloom_identity_v1_0.md
  - Bundle_Versioning_Semantics_heartloom_identity_v1_0.md
  - Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md
  - Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md
  - Heartloom-AI-Policies/required-reference-docs.md
exclusions:
  - .git/
  - dotfiles
  - install.sh
  - change-control/gate/installer-contract/maintenance docs
  - non-markdown files unless explicitly required
intended_consumers_or_compatibility:
  - downstream repositories consuming shared identity canon
notes_or_warnings:
  - semantics are canonical; publish tooling may still be manual or absent
```

The format shown above is illustrative and human-readable; future implementation may serialize the same semantic fields in another format without changing meaning.

## How bundle contents are enumerated

- Manifest content enumeration should be explicit (file paths and/or clearly named doc categories).
- Enumeration must be specific enough for consumers to verify inclusion/exclusion decisions.
- Enumeration should remain consumer-facing; avoid maintainer-internal implementation detail.

## Relationship between manifest and tagged/versioned bundle

- A manifest describes exactly one versioned bundle snapshot.
- `bundle_version` and `source_ref` should align with the tagged/versioned release identity.
- The tagged/versioned bundle and its manifest should be treated as immutable once published.
- If content changes, publish a new bundle version with an updated manifest.

## Release-prep semantics (readiness criteria)

A future bundle is considered **ready to publish** only when all checklist areas below are satisfied:

1. **Docs consistency**
   - Canonical docs referenced by the bundle are internally consistent.
   - No contradictory state claims across `README.md`, `INDEX.md`, consumer integration, and bundle semantics docs.
2. **Inclusion/exclusion review**
   - Included docs match `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md` inclusion rules.
   - Excluded content avoids internal/maintainer artifacts by default.
3. **Consumer-facing clarity**
   - Manifest fields are complete and human-readable.
   - Intended consumer scope and warnings are explicit.
4. **Version/tag alignment**
   - Manifest `bundle_version` aligns with intended release tag/version identifier.
   - Manifest `source_ref` points to the exact upstream state being published.
5. **Release notes expectation**
   - A short consumer-facing release note/changelog entry exists describing what changed and upgrade impact.

## Publishable artifact exclusions (default)

Unless explicitly elevated in future canon, publishable consumer bundle artifacts exclude:

- `.git/` internals.
- Dotfiles/local environment files.
- `install.sh` and installer implementation mechanics.
- `tooling/codex-global/` and other future `~/.codex` runtime-source/operator tooling files.
- Change-control transition/gate validation records.
- Installer contract internals and maintenance/migration/tooling records.
- Non-markdown files unless explicitly required for downstream consumption.

## Semantics-defined vs ready-to-publish distinction

- **Semantics defined:** canonical rules exist (this document + bundle/versioning semantics).
- **Ready to publish:** a specific bundle candidate satisfies release-prep criteria and has aligned manifest/version metadata.

Defining semantics does not imply that publication tooling, automated checks, or published artifacts already exist.

## Future changelog / release notes expectation

When bundle publishing exists, each bundle version should include a concise consumer-facing summary of:

- changed docs/content scope,
- compatibility or behavior-impact notes,
- upgrade guidance for pinned consumers.

This expectation can begin manually and later be automated without changing semantics.

## First bundle candidate scope reference

Canonical first concrete bundle-candidate selection is documented in:

- `First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md`

Release-prep checks should evaluate a candidate bundle against that scope definition before any future publication.

## Non-goals in this slice

- No release automation.
- No bundle generation tooling.
- No CI changes.
- No installer code changes.
- No authority changes.
- No session-pack automation.
- No repo restructuring.
- No consumer tooling implementation.

Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md EOF
