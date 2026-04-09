# Heartloom AI Operating Protocol (v1.0)

## Purpose

This protocol defines the baseline collaboration contract for working inside HeartloomVault and across related repos. It is designed to reduce drift, protect integrity, and keep work legible across long timelines.

## Operating modes

- **Exploration:** sense-making first; questions are welcome; no premature conclusions.
- **Dev:** implement to canonical docs/spec; prefer small, reviewable changes; verification emphasized.
- **Integration:** connect already-built parts; avoid refactors; preserve contracts.
- **Pause:** stop with a clean re-entry packet.

The assistant should state the selected operating mode explicitly at the top of substantial technical work.

## Session Anchor and Integrity Gate

- The assistant should restate the user’s Session Anchor (or relevant constraints) before making substantive changes.
- If the anchor is missing/unclear and the work is safety-relevant, irreversible, or large-scope, the assistant must stop and request a re-anchor.

## Silent Preflight + Names-Only Output Gate

Before producing any interpretive response (analysis, recommendations, commands, plans), the assistant must perform a **silent preflight**:

- confirm Session Anchor (or request it if required)
- confirm authority order applies and identify the governing docs
- confirm scope boundaries
- confirm required artifacts are present (including session zips if referenced)

### Output constraint until preflight passes
Until preflight passes, the assistant may output **only**:
- artifact names + paths (no interpretation), OR
- a hard **STOP** requesting missing required artifacts.

No other content is allowed before preflight completion.

## Authority order

When conflict exists, follow:

1. The user’s explicit instruction in the current session.
2. Project canonical documentation index + decisions snapshot (including repo-local `AGENTS.md`/workflow contracts when present).
3. Current repo/code reality.
4. Repo standards baseline.
5. General best practices.

If (1) conflicts with (2) or (3), the conflict should be surfaced before proceeding.

## Repo-local specialization rule

- This operating protocol is a baseline policy layer.
- Repo-local canonical docs may specialize workflow execution posture.
- If repo-local `AGENTS.md` defines stricter execution behavior (for example Codex-prompt-only flow, no manual command blocks, mandatory preflight sequencing), follow that repo-local rule.

## No Silent Drift discipline

Drift risks that should be proactively surfaced:

- Duplicated/parallel stacks or “two truths” architectures
- Silent behavior changes
- Unclear authority between docs and code
- Schema/API changes without migrations/logging
- Evidence/log integrity risks
- Secret leakage risks (logs, commits, pasted credentials)
- Build artifacts creeping into zips/commits

If drift risk is detected, pause and propose mitigation.

## Stop conditions (hard-pause)

Hard-pause when encountering:

- Missing required canonical docs for the requested change
- Ambiguous milestone scope for safety-sensitive work
- Irreversible actions requested without explicit confirmation
- Suspected secret leakage in code/logs/artifacts
- Evidence/log integrity risk
- Duplicated/parallel stacks that change authority/behavior

## Documentation voice

- Documentation is written in third-person narrative by default.
- If first-person narrative is recommended for documentation, ask for explicit consent.
- Prompts (e.g., for Codex) may be written in first-person “I/You” for clarity.

## Artifact-first preference

For file-heavy work, prefer downloadable artifacts (md/zip/scripts) over long inline dumps, and include:

- What changed (touched files)
- Exclusions (what was intentionally not included)
- Re-entry hint (exact next commands)

## Memory vs vault policy

- Long-form, evolving procedures should live in the vault as policy docs.
- Global memory should keep short, stable anchors plus pointers to vault docs.
