# Distinctions Library: heartloom-identity (v1.0)

Status: **CANONICAL LIBRARY DEFINED**  
Type: Reusable distinctions vocabulary (anti-drift)  
Scope: Source-alignment distinctions for docs, reviews, workflow, packs, and exports

## Purpose

Define a small, repeatable distinctions vocabulary so humans and future agents can review changes in `heartloom-identity` without collapsing upstream source meaning into downstream implementation structure.

## Evidence Block

- [`heartloom-source`](https://github.com/i-schuyler/heartloom-source) canon consistently separates source meaning/law/orientation from implementation structure.
- [`heartloom-identity`](https://github.com/i-schuyler/heartloom-identity) canon consistently frames identity as bounded translation/inheritance (not source redefinition).
- Existing pack/export contracts already depend on distinctions between canonical source docs and downstream/generated artifacts.
- Existing alignment checklist already asks for routing, translation-vs-redefinition checks, and drift detection.

## V1 scope note

- Consolidates recurring distinctions already present across source and identity canon.
- Explicitly names one previously ambiguous edge: **North-Star Alignment vs Operational Convenience**.
- Collapses near-duplicate framing (“meaning vs implementation” and “law vs workflow”) under one canonical distinction.

## Canonical distinctions (v1)

### 1) Source Meaning/Law/Orientation vs Identity Workflow/Implementation

- **Short meaning:** Upstream source defines meaning/law/orientation; identity defines downstream translation, workflow, packs, exports, and implementation choreography.
- **Why it matters:** Preserves upstream authority while keeping identity operationally useful.
- **Common failure mode / drift pattern:** Workflow mechanics in identity are treated as if they redefine source meaning.
- **Applies most often:** source, identity, workflow.

### 2) Translation vs Redefinition

- **Short meaning:** Translation adapts source into operational structure; redefinition changes source meaning.
- **Why it matters:** Translation is allowed in identity; redefinition requires upstream routing.
- **Common failure mode / drift pattern:** “Minor wording” quietly changes source-level semantics.
- **Applies most often:** identity, source, workflow.

### 3) Upstream vs Here vs Downstream

- **Short meaning:** Place changes where they belong: source (meaning/law), identity (translation/inheritance), downstream repos (repo-local implementation).
- **Why it matters:** Prevents role collapse and reduces cross-layer confusion.
- **Common failure mode / drift pattern:** Identity accumulates downstream implementation details or tries to own source-level canon.
- **Applies most often:** source, identity, downstream, workflow.

### 4) Canonical Source Doc vs Exported Artifact

- **Short meaning:** Canonical docs are authoring source; exports are downstream snapshots.
- **Why it matters:** Keeps authority traceable and avoids artifact-driven canon drift.
- **Common failure mode / drift pattern:** Consumers treat a zip/export as the authoritative source text.
- **Applies most often:** exports, identity, downstream.

### 5) Reference Pack vs Working Pack

- **Short meaning:** Reference Pack is clean consumer-facing canonical subset; Working Pack is operator-facing mutable context that may include local/generated/sensitive artifacts.
- **Why it matters:** Protects consumer clarity and prevents sensitive/noisy internals from becoming distribution defaults.
- **Common failure mode / drift pattern:** Working Pack outputs are treated like publishable reference artifacts.
- **Applies most often:** packs, exports, identity, downstream.

### 6) Committed Canonical Doc vs Generated Local Artifact

- **Short meaning:** Canonical docs belong in git; generated local/staged/sensitive artifacts stay local and uncommitted.
- **Why it matters:** Protects repo integrity, reproducibility, and security boundaries.
- **Common failure mode / drift pattern:** Local outputs (logs/zips/staging files) are promoted into canonical source.
- **Applies most often:** identity, packs, exports, workflow.

### 7) North-Star Alignment vs Operational Convenience

- **Short meaning:** Convenience can optimize execution, but must not override source law/orientation or relational constraints.
- **Why it matters:** Prevents fast-path decisions from eroding canonical intent.
- **Common failure mode / drift pattern:** “Quick practical fix” bypasses alignment checks and introduces semantic drift.
- **Applies most often:** source, identity, workflow, downstream.

## How to use this library

Use alongside `Checklists/Alignment_Review_Checklist_v1_0.md`:

1. Name which distinction(s) are in play for a slice.
2. Confirm placement (upstream / here / downstream).
3. Route or proceed based on distinction boundaries.

## Non-goals in this slice

- No CI enforcement logic.
- No source mirroring.
- No installer/pack/export implementation changes.

Reference/Distinctions_Library_v1_0.md EOF
