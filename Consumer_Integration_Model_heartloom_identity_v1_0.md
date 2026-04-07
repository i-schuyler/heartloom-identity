# Consumer Integration Model: heartloom-identity (v1.0)

Status: **IMPLEMENTED GUIDANCE (near-term model active; long-term bundle model proposed)**  
Type: Cross-repo consumption and override governance model  
Scope: How other repositories consume, extend, and propose changes to `heartloom-identity`

## Purpose

Define the canonical integration model for consumer repositories that depend on shared identity/policy documentation from this repo.

This document governs integration behavior and proposal flow. It does **not** implement packaging/release automation.

## State distinction (required)

- **Implemented now (near-term):** consumer repos consume installed local snapshots of `00_Identity` docs.
- **Implemented now (source):** this repo is the maintained upstream source for docs and installer behavior.
- **Still pending:** practical authority transition completion remains gated by:
  - `Authority_Transition_Gate_Installer_Validation_v1_0.md`
- **Proposed long-term:** versioned release artifact / packaged policy bundle distribution.

## Recommended near-term consumer pattern (active)

Consumer repos should use a local installed copy/snapshot model:

- Consume from local vault-installed `00_Identity` copy maintained by installer flow.
- Treat consumed docs as a pinned snapshot for that consumer repo’s working period.
- Record snapshot provenance in consumer-repo docs (at minimum: source repo, commit/tag or date stamp, and install date).

## Preferred long-term distribution pattern (proposed)

When implemented in future slices, consumer repos should prefer versioned distributions:

- Versioned release artifact or packaged policy bundle published from `heartloom-identity`.
- Consumer repos pin to explicit bundle version identifiers.
- Upgrade cadence becomes explicit and reviewable via version bumps.

This long-term distribution model is aspirational here and is not implemented in this slice.

## Local extension model (allowed)

Consumer repos may add local extension docs when they:

- Clarify repo-specific implementation details, constraints, or process overlays.
- Keep extension scope explicit and local to that consumer repo.
- Clearly reference upstream canonical docs that the extension depends on.

Recommended naming pattern in consumers:

- `docs/identity-local-extensions/` for additive local interpretation docs.

## Local override model (allowed only when explicit)

Consumer repos may override shared identity docs only under explicit, bounded conditions:

- Override must be documented in a local override register (for example `docs/identity-local-overrides.md`).
- Each override entry must include:
  - overridden upstream document/section,
  - rationale,
  - scope boundary,
  - owner,
  - review cadence,
  - sunset/removal condition.
- Override must not silently alter upstream meaning outside documented local boundary.

## Forbidden override areas

Consumer repos must not locally override these without upstream approval in `heartloom-identity`:

- Canonical vault target path definitions.
- Installer contract core semantics (scope roots, non-prune default, exclusion boundaries).
- Authority transition gate READY/NOT READY criteria.
- Clipboard output-contract canon in GitHub/Codex workflow policy.

If a consumer needs change in these areas, it must propose upstream changes first.

## Local-only docs vs shared canonical docs

- **Local-only docs:** consumer-specific operational details, project constraints, and implementation notes.
- **Shared canonical docs:** identity/policy contract docs maintained in this repo and consumed downstream.
- Local-only docs must reference shared canonical docs rather than duplicating them wholesale.

## Upstream change proposal path (consumer -> heartloom-identity)

When consumer repos identify needed upstream changes:

1. Open a consumer-repo issue/decision note documenting the gap and local impact.
2. Prepare a docs-first proposal scoped to upstream canonical docs.
3. Open a PR in `heartloom-identity` with:
   - problem statement,
   - proposed canonical text change,
   - consumer impact notes,
   - backward-compatibility/risk notes.
4. Keep local consumer override temporary until upstream decision is merged/rejected.
5. Reconcile consumer local docs after upstream decision.

## Future version pinning expectations (for bundle model)

When versioned bundles/artifacts exist, consumer repos are expected to:

- Pin to explicit version identifiers (tag or release version).
- Record pinned version in consumer repo docs.
- Update only through explicit review (no silent floating latest).
- Maintain a short compatibility note when lagging behind latest bundle.

## Non-goals in this slice

- No release automation.
- No bundle packaging implementation.
- No installer code changes.
- No authority flip changes.
- No CI changes.
- No session-pack automation.
- No cross-repo runtime tooling implementation.
- No repo restructuring.

Consumer_Integration_Model_heartloom_identity_v1_0.md EOF
