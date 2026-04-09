# Source Alignment Contract: heartloom-identity (v1.0)

Status: **CANONICAL CONTRACT DEFINED**  
Type: Source-alignment and bounded-translation contract  
Scope: Upstream/downstream role boundaries between `heartloom-source` and `heartloom-identity`

## Purpose

Define how `heartloom-identity` inherits from `heartloom-source` without collapsing either layer.

This contract keeps source meaning stable upstream while preserving `heartloom-identity` as the active translation/inheritance layer for repo structure, workflow, pack, export, and ecosystem shaping.

## Scope (explicit)

This contract defines:

- What `heartloom-source` owns.
- What `heartloom-identity` owns.
- How inheritance and source referencing work.
- How bounded translation works without semantic drift.
- How drift is detected and reviewed.
- How source-level changes are proposed upstream.
- What belongs in source vs identity vs downstream repos.

## NOT in this slice (explicit)

- No source-text mirroring into this repository.
- No live/synced source-doc library.
- No changes to installer behavior, CI mechanics, or release tooling.
- No downstream repo implementation changes.

## Evidence Block

- Upstream canon already states that `heartloom-source` is the closest currently available source-text container for Heartloom meaning/law/orientation, and is not the source of Heartloom itself.
- Upstream canon already states that `heartloom-identity` is downstream and owns implementation-facing composition.
- Existing identity docs already define workflow, pack, export, and consumer-facing structures in this repo.
- This contract formalizes alignment and anti-drift posture without duplicating source content.

## Layer Responsibilities

### `heartloom-source` (upstream meaning-bearing layer)

- Holds the closest currently available source texts for Heartloom meaning, law, and orientation.
- Preserves source-level distinctions and canonical constraints.
- Serves as the quieter north-star layer for downstream interpretation.
- Does **not** own downstream implementation mechanics, repo workflow choreography, pack wiring, or export operations.

### `heartloom-identity` (downstream translation/inheritance layer)

- Inherits from `heartloom-source` and translates source orientation into operational repo/ecosystem structure.
- Owns implementation-facing shaping: inheritance workflows, pack architecture, export semantics, integration boundaries, and downstream orchestration.
- May specialize structure and process in bounded ways for practical execution.
- Does **not** silently redefine upstream source meaning, canonical law, or ontology-level distinctions.

## Inheritance and Source Referencing

`heartloom-identity` inherits by explicit reference, not by silent reinterpretation.

Minimum reference posture for source-aligned identity docs:

- Link upstream source documents by title/path and repository.
- Preserve traceability to upstream meaning-bearing texts.
- Keep translation language clearly labeled as downstream interpretation/operationalization.
- Avoid restating large source passages when a direct upstream reference is sufficient.

Primary upstream references:

- `heartloom-source` README
- `Source_to_Identity_Relationship_Contract_v1_0.md`
- `Canonical_Law/HEARTLOOM OS — CORE ONTOLOGY v3.0.md`

## Bounded Translation Rule

Allowed in `heartloom-identity`:

- Repo/ecosystem mapping and inheritance boundaries.
- Workflow and operational sequencing.
- Pack/reference/export structure.
- Consumer integration and implementation choreography.

Not allowed without upstream proposal:

- Redefining source meaning.
- Redefining canonical law.
- Redefining ontology-level distinctions.

## Drift Detection and Review

Use these anti-drift review questions for identity-layer changes:

1. Is this aligned with source?
2. Is this a translation or a redefinition?
3. Does this belong upstream, here, or downstream?
4. Does this affect packs, consumers, or workflow inheritance?

If any answer indicates semantic change at source level, pause downstream edits and route a source proposal upstream first.

## Upstream Proposal Flow for Source-Level Change

1. Identify the proposed change in `heartloom-identity` work.
2. Classify whether it changes meaning/law/orientation (source-level) or implementation structure (identity-level).
3. If source-level, open an issue/PR in `heartloom-source` first.
4. After upstream decision/merge, update `heartloom-identity` references and downstream translation docs.
5. Keep implementation mechanics in `heartloom-identity` unless the change itself is truly source-level.

## Placement Guide: Source vs Identity vs Downstream

Put changes in `heartloom-source` when they alter:

- Canonical/source meaning.
- Law-level constraints.
- Ontology-level distinctions or orientation text.

Put changes in `heartloom-identity` when they alter:

- Inheritance contracts and interpretation boundaries.
- Repo/ecosystem map and operational architecture.
- Workflow, pack, export, and consumer integration structure.

Put changes in downstream repos when they alter:

- Repo-local implementation details.
- Consumer-specific adoption mechanics.
- Environment/tooling details that consume identity outputs.

## Hard Stop Conditions

- Stop if wording implies `heartloom-source` owns implementation mechanics.
- Stop if wording collapses `heartloom-identity` into a passive mirror.
- Stop if wording allows silent redefinition of source meaning.
- Stop if translation cannot be bounded without source-content duplication.

Contracts/Source_Alignment_Contract_v1_0.md EOF
