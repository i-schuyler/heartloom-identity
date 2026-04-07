# Bundle + Versioning Semantics: heartloom-identity (v1.0)

Status: **CANONICAL SEMANTICS DEFINED (release/bundle tooling not implemented)**  
Type: Consumer-facing bundle contract and versioning expectations  
Scope: What future release artifacts/bundles should contain, and how consumers should pin and upgrade

## Purpose

Define the canonical semantics for future versioned release artifacts / packaged policy bundles produced from `heartloom-identity`.

This document defines expected behavior now so downstream repos can align early. It does **not** imply current release automation, bundle generation tooling, or installer changes.

## Implemented vs future state (required clarity)

- **Implemented now:** consumer repos commonly consume installer-managed local snapshots of `00_Identity` docs.
- **Implemented now:** this repo is the maintained upstream canonical source for shared identity/policy docs.
- **Defined now for future use:** bundle scope and versioning semantics in this document.
- **Not implemented yet:** official release artifact publishing, bundle generation tooling, and installer-based bundle installation.

## Bundle purpose

The future bundle exists to provide a stable, versioned, consumer-ready subset of this repo’s canon that downstream repos can pin and review during upgrades.

Bundle goals:

- Reduce ambiguity about what downstream consumers must follow.
- Exclude maintainer/internal process records that are not needed for consumption.
- Make upgrades explicit through version bumps instead of drifting snapshots.

## Canonical bundle boundary

- Bundle contents are a **subset** of repository contents.
- Not every file in `heartloom-identity` is bundle-eligible.
- Inclusion is driven by downstream consumption needs, not by repository completeness.

## Inclusion criteria (must include only if true)

A document is bundle-eligible when it is all of the following:

- Consumer-facing canonical guidance (not maintainership-only process).
- Required to interpret or apply shared `00_Identity` canon in downstream repos.
- Stable enough to be version-pinned and reviewed as part of upgrade decisions.
- Markdown canonical docs (`.md`) unless an explicit future exception is ratified.

## Exclusion criteria (exclude by default)

The bundle excludes repository-maintainer/internal materials unless explicitly elevated in a future canonical slice:

- `.git/` and other VCS internals.
- Dotfiles and local environment/config convenience files.
- `install.sh` and installer execution mechanics.
- Change-control transition records and gate-validation records.
- Installer contract docs and maintenance/migration/tooling docs.
- Non-markdown files unless explicitly required for downstream consumption.

## Initial consumer bundle profile (v1.0 semantics)

If a first release bundle is produced under this semantic model, it should be **docs-only** and consumer-minimal.

Include documents that define downstream consumption behavior and canonical interpretation, including:

- `README.md` (consumer-facing orientation).
- `INDEX.md` (consumer discovery/navigation).
- `Consumer_Integration_Model_heartloom_identity_v1_0.md` (integration/override governance).
- `Bundle_Versioning_Semantics_heartloom_identity_v1_0.md` (this bundle/versioning contract).
- `Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md` (policy entrypoint).
- `Heartloom-AI-Policies/required-reference-docs.md` (required reference baseline).

This profile intentionally avoids internal transition/maintenance artifacts.

## Versioning expectations

- Future bundles should publish explicit, immutable version identifiers.
- Consumers should treat versions as pinned contract snapshots, not floating latest references.
- Version identifiers should map to a unique upstream repository state.
- Any future versioning scheme (for example semver-like) must preserve predictable upgrade review behavior.

## Consumer pinning model

When bundles become available, consumer repos should:

- Pin to an explicit bundle version.
- Record the pinned version in consumer repo docs/metadata.
- Upgrade only by deliberate version bump reviewed in repo workflow.
- Avoid automatic/floating updates to newest bundle without explicit review.

## Upgrade posture and compatibility expectations

- Upgrades are expected to be explicit, reviewable, and documented.
- Consumers may lag latest version temporarily, but should keep a short compatibility note.
- Local overrides remain bounded and must not silently redefine upstream canonical meaning.
- If a needed change crosses forbidden override boundaries, propose upstream changes first.

## Relationship to local installed snapshots

- Local installer-managed snapshots remain the active near-term implementation model.
- Future released bundles are a distribution model layered on top of canonical semantics defined here.
- Defining bundle semantics now does not change current installer authority or runtime behavior.

## Manifest and release-prep reference

Canonical future bundle manifest shape and release-prep readiness semantics are defined in:

- `Bundle_Manifest_Release_Prep_Semantics_heartloom_identity_v1_0.md`

## First bundle candidate scope reference

Canonical first concrete bundle-candidate include/exclude scope is defined in:

- `First_Bundle_Candidate_Selection_heartloom_identity_v1_0.md`

## Non-goals in this slice

- No release automation.
- No bundle generation tooling.
- No installer code changes.
- No authority changes.
- No CI changes.
- No session-pack automation.
- No repo restructuring.

Bundle_Versioning_Semantics_heartloom_identity_v1_0.md EOF
