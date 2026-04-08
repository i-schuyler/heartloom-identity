# Alignment Review Checklist: heartloom-identity (v1.0)

Status: **CANONICAL CHECKLIST DEFINED**  
Type: Repeatable anti-drift review checklist  
Scope: Source-alignment reviews for docs/repo/workflow changes in `heartloom-identity`

## Purpose

Provide a short, repeatable review tool that helps humans and future agents verify that `heartloom-identity` remains aligned to upstream `heartloom-source`.

## When to run this checklist

Run this checklist when a slice changes any of the following:

- Canon, contracts, definitions, or core orientation language.
- Repo inheritance/workflow/pack/export structure.
- Newcomer navigation and source↔identity framing.
- Downstream consumer integration boundaries.

## Quick triage / scope gate

Before deeper review, classify the change:

1. **Source-level semantic change?** (meaning/law/orientation/ontology)
2. **Identity-level translation change?** (inheritance/workflow/pack/export/ecosystem shaping)
3. **Downstream implementation change?** (consumer-repo operation/adoption details)

If classification is unclear, pause and route for clarification before merge.

## Source-alignment questions

Answer each as **Yes / No / Unclear**:

1. Is this aligned with upstream source meaning, law, and orientation?
2. Is this a translation/operationalization rather than a redefinition?
3. Are upstream references explicit and traceable where needed?
4. Does wording avoid implying that identity owns source meaning/law?

Any **No** or **Unclear** requires pause and routing action.

## Placement questions (upstream / here / downstream)

1. Does this belong in `heartloom-source` because it changes source meaning/law/orientation?
2. Does this belong in `heartloom-identity` because it changes translation/inheritance structure?
3. Does this belong in downstream repos because it changes consumer-specific implementation?

If placement answer conflicts across reviewers, stop and escalate placement decision.

## Inheritance / pack / workflow impact questions

1. Does this affect inheritance boundaries for downstream docs/repos?
2. Does this affect pack semantics (Reference Pack / Working Pack)?
3. Does this affect export expectations or consumer integration assumptions?
4. Does this affect workflow inheritance (authoring, review, routing, governance)?

If impact exists, record the affected docs/repos explicitly in review notes.

## Warning signs of drift

- Source meaning is being reinterpreted without upstream review.
- Implementation convenience is overriding source law/orientation.
- Source-level concepts are being absorbed into identity silently.
- Pack/export/workflow logic is being mistaken for source meaning.
- Newcomer navigation is becoming ambiguous again.

If any warning sign appears, pause and route before merge.

## Outcome routing

### Proceed here (`heartloom-identity`)

Use when change is bounded translation/inheritance/workflow/pack/ecosystem shaping and remains source-aligned.

### Stop and route upstream (`heartloom-source`)

Use when change affects source meaning, law, orientation, or ontology-level distinctions.

### Stop and route downstream (consumer repo)

Use when change is implementation/operations specific to a downstream repo.

### Document bounded translation/constraint

When proceeding in identity, record:

- What was translated (not redefined).
- What remains owned upstream.
- What downstream implications exist.

## Minimal review record (copy/paste)

- Slice/PR:
- Reviewer:
- Classification (source / identity / downstream):
- Source-alignment result (Yes/No/Unclear):
- Placement result (upstream / here / downstream):
- Impacted inheritance/pack/workflow surfaces:
- Warning signs observed (if any):
- Routing decision (proceed here / route upstream / route downstream):

## Hard stop conditions

- Stop if checklist use implies identity owns source meaning/law.
- Stop if alignment cannot be determined from available references.
- Stop instead of adding CI enforcement logic in this checklist slice.

Alignment_Review_Checklist_heartloom_identity_v1_0.md EOF
