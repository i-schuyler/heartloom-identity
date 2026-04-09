# authority-boundary-map-v1.0.md
Version: v1.0  
Status: APPROVED
Scope: HeartloomVault — Heartloom Identity authority + session intake boundaries

---

## 0) Purpose

This document defines **what sources are authoritative**, in what order, and how the Assistant must interpret session language and resolve conflicts **without silent drift**.

---

## 1) Interpretation rules for session language (global)

These interpretation rules apply to **this session and every session** unless a higher-authority doc overrides them.

### 1.1 Pronouns and collective language

- When the user writes **“you / your / you’ll / etc.”** it refers to **The Assistant** (the agent responding in chat and/or the Codex agent when explicitly invoked).
- When the user writes **“we / us / together”** it means **User + The Assistant** collaborating.
- When the user writes **“I”** it means **the user**.
- When the user writes **“Codex”** it refers to the separate Codex agent with **zero access** to chat history unless pasted or present in repo/docs.

### 1.2 Hard boundary (STOP triggers)

If any instruction is ambiguous in a way that could affect any of the following, the Assistant must **STOP** and ask before proceeding:

- security boundary / auth gating
- schema/data integrity (including forward-only migrations)
- irreversible drift (renames, moves, deletions, contract changes)
- secrets hygiene (tokens, passwords, UIDs, private keys, passphrases)
- actions that could cause data loss or permanent device state changes

If ambiguity is low-risk and reversible:
- proceed with the safest conservative default,
- label it **[TENTATIVE]** in an Assumptions Registry,
- ask the clarifying question anyway (so it can be confirmed/locked).

---

## 2) Authority ladder (highest wins)

When sources conflict, resolve by this order (highest wins).  
**User instructions in the current session do not override items (1–3).**

1) **Heartloom Identity** (highest authority)  
2) **Project canonical docs index** (e.g., `docs/Canonical_Documentation_Index_v1_0.md`) + docs it references  
3) **Repo/code reality** (existing structure/contracts + implemented behavior; used to avoid hallucinating, but does **not** override 1–2)
4) **User instructions in the current session** (unless they conflict with 1–3)  
5) **Best-practice suggestions** (optional, consent-required for material changes)

### 2.1 Conflict handling rule

If the user’s instruction conflicts with items (1–3), the Assistant must:
1) **STOP** the work, and
2) propose a **docs-only Change-Control** to reconcile the conflict.

---

## 3) Intake sequence at the start of a session

Unless a higher-authority doc specifies otherwise, the Assistant must begin by consulting, in this order:

1) **Heartloom Identity required-reference-docs** (read or STOP)  
2) **Heartloom Identity policy index** (so the Assistant knows what “canon” exists)  
3) **Project Instructions** (this project’s rules)  
4) **Project Files** that define structure (e.g., file tree, directory blocks, canonical indexes)  
5) **User’s current session anchor + constraints**  
6) Only then: propose work plan / slices / artifacts

---

## 4) Canonical “reference pack” model (stable base + per-project overlays)

The user wants both:
- a **stable base** that applies everywhere, and
- an option to include **project-specific** add-ons.

### 4.1 Stable base (cross-project, rarely changes)

Examples:
- canonical vault name + Android path
- sync vs backup model
- canonical Termux outputs location
- SSH key locations map
- vault meta file tree / directory blocks
- global governance defaults

Recommendation:
- Maintain a **single stable base pack** (zip or doc list) referenced by `required-reference-docs.md`.

### 4.2 Per-project overlay (varies by project)

Examples:
- project repo structure + canonical index
- project-specific locked decisions and contracts
- project-specific drift ledger / assumptions registry

Recommendation:
- Keep overlays as **project files** within each project’s own space (repo or vault project folder).

### 4.3 Practical implementation (recommended)

- `Heartloom-Identity/Heartloom-AI-Policies/required-reference-docs.md` lists:
  - **Always-refer** stable docs (base pack)
  - **Often-refer** project-local docs (overlay), with placeholders like:
    - “Project Files: File Tree”
    - “Project Instructions: …”

---

## 5) What the Assistant can “see” across ChatGPT projects

The Assistant can only use:
- files attached to the **current** chat/session, and/or
- text you paste into the conversation.

The Assistant cannot automatically browse, enumerate, or inspect “Project Files” that exist in other ChatGPT Projects unless you attach them to the current session (or paste their content).

Cross-project reuse pattern:
- keep the stable base in `Heartloom Identity`,
- attach (or zip/export) a project’s “Index / File Tree / Directory Blocks” into the current session when needed.

---

## 6) Naming conventions: “_” vs “-” vs “—”

This is a convention guide, not a forced migration.

- **Underscore `_`**: preferred for **vault/identity docs** where readability + stability matters and renames are undesirable.
- **Hyphen `-`**: preferred for **GitHub repos** and **folder titles that must match repo names** (CLI-friendly, web-friendly).
- **Em dash `—`**: use in **human-facing titles** (headings, PDF titles, README prose), not in filenames.

If a future policy requires enforcing hyphens within Identity, it must be a deliberate Change-Control because it risks link churn.

---

## 7) Heartloom Identity contents + zip inclusion policy

### 7.1 Expected future contents of Heartloom Identity

Possible future additions:
- “Session anchor” seeds, shared checklists, stable reference maps, and canonical indexes.

### 7.2 Zip inclusion recommendation (phone-first)

Preference: exclude `PROMPT - Template.md` because it’s “used live” at session start.

Recommendation:
- The “Identity PDF/EPUB build” should target **Protocols only** by default.
- Keep `PROMPT - Template.md` outside that bundle, or exclude it via a build manifest / exclude list.

Implementation options:
- Exclude file in the zip/build script, OR
- Build from an explicit “reading order manifest” that simply doesn’t include it.

---

## 8) Link breakage clarification

“Link breakage” refers to:
- Obsidian wikilinks/markdown links between notes, AND/OR
- references in other repos/docs to these filenames/paths.

Even if links are currently mostly internal to Identity, renames can still create churn later.
Prefer **indexes/routers first**, renames later only with an explicit migration plan.

---

## 9) Change-Control note (known current mismatch)

Known mismatch to resolve (docs-only):
- PR workflow default: `gh pr create` should be default; `gh api` fallback only.

Update targets:
- `github-and-codex-pr-first-policy-v1.0.md`
- `PROMPT - Template.md`

---

authority-boundary-map-v1.0.md EOF