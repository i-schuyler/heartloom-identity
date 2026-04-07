# Codex Execution Profiles Contract: heartloom-identity (v1.0)

Version: v1.0  
Type: Canonical execution-profile contract (docs-only)  
Scope: Codex runtime profiles, approval/sandbox/network semantics, and workflow impact  
Status: Defined for use; does not implement config or tooling

---

## Purpose

Define canonical Codex execution profiles for heartloom-identity so repo work is consistent, safe, and aligned with PR-first workflow expectations.

This contract documents profile intent only. It does **not** create config files, change installer behavior, or enable any automation.

---

## Authority and Configuration Layers

- **Config layer (runtime behavior):** Approval policy, sandbox mode, and network access are controlled by Codex configuration files, not by `AGENTS.md`.
  - Personal defaults live in `~/.codex/config.toml`.
  - Project overrides (trusted projects) live in `.codex/config.toml`.
- **Instruction layer (operational guidance):** `AGENTS.md` provides behavior guidance and workflow constraints, but does **not** set sandboxing, approvals, or network access.
- **UI flow boundary:** The app review/apply flow governs how edits are proposed and applied; it is **separate** from command approval policy. Changing approval policy does not disable review/apply behavior.

---

## Canonical Profiles

### 1) Default Safe Profile (Local Repo Work)

**Use when:** Reading, planning, editing docs/code locally, and general repo work without GitHub push/PR actions.

Settings (canonical intent):
- `approval_policy = "never"`
- `sandbox_mode = "workspace-write"`
- `network_access = false`

Allows:
- Read/write in repo workspace.
- Local git operations (status, diff, commit) without network.

Disallows:
- GitHub push, fetch, or PR creation (network required).

Notes:
- This is the default recommended profile for day-to-day work.

---

### 2) GitHub/PR Profile (Network-Enabled)

**Use when:** Push to remote and/or create PRs via CLI/app tooling.

Settings (canonical intent):
- `approval_policy = "never"`
- `sandbox_mode = "workspace-write"`
- `network_access = true`

Allows:
- All local repo work plus GitHub push/PR creation.

Disallows:
- Nothing beyond configured sandbox and network boundaries.

Notes:
- Enable only when push/PR work is explicitly desired.
- Network-disabled `workspace-write` **cannot** perform GitHub push/PR actions.

---

## Relationship to Global and Repo Instructions

- This contract coexists with `AGENTS.md` (instruction layer) and the Codex global install contract.
- The global install contract defines **where** future Codex runtime files live and how they map to `~/.codex/` if explicitly installed.
- This contract defines **what** profiles should contain and **when** to use them.

---

## Implemented vs Future

- **Implemented now:** Documentation of profile intent and constraints.
- **Not implemented yet:** Actual config files, installation flows, or automation to switch profiles.

---

## Evidence Block

- Codex personal defaults live in `~/.codex/config.toml`.
- Project overrides live in `.codex/config.toml` for trusted projects.
- `AGENTS.md` provides instructions, not sandbox/approval config.
- Local/worktree tasks in the app support commit/push/create PR via built-in Git tools.
- Network-disabled `workspace-write` prevents GitHub push/PR actions.
- App review/apply flow is distinct from command approval policy.

---

## Hard Stop Conditions

- Stop if any wording implies `AGENTS.md` controls approval policy, sandbox mode, or network access.
- Stop if any wording implies app review/apply behavior can be fully disabled by approval policy alone.
- Stop if any wording implies push/PR actions work with network disabled.
