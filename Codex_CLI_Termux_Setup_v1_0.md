# Codex CLI in Termux — Setup and Safe Operation (v1.0)

Version: v1.0  
Scope: Cross-project (Termux + Codex CLI usage)  
Purpose: Document how Codex CLI is installed in Termux, how repo-scoped guardrails are configured, and how to operate Codex safely with minimal friction on safety-adjacent projects.

---

## 1) Installation Location (Termux)

Codex CLI should be installed globally via npm so it is available across all repositories under `~/projects/`.

Rationale:
- One `codex` binary serves all repos.
- Repo-specific safety posture is controlled by repo-scoped configuration and guardrail docs, not by per-repo installs.

Recommended verification:
- `which codex`
- `codex --version`
- Inside a repo: run `codex`, then `/status`

Version strategy:
- Prefer the Codex CLI LTS line in Termux to reduce breakage risk from fast-moving dependencies.
- Upgrade intentionally and validate with a short read-only session after any upgrade.

---

## 2) Repo-Scoped Guardrails (Per Repo)

Each repository should treat Codex as governed by:
- `.codex/config.toml` (repo-scoped configuration anchor)
- `AGENTS.md` (repo-scoped operational rules for Codex behavior)

Notes:
- The exact schema/keys supported by `.codex/config.toml` may evolve by Codex version. The file is treated as an anchor for intent (model defaults, approval posture, safety constraints) rather than a brittle contract of specific key names.
- `AGENTS.md` should be treated as the operational authority for “what Codex is allowed to do in this repo.”

---

## 3) Approval Mode Strategy (Friction vs Safety)

Codex approval modes trade convenience for safety.

Recommended posture:
1. Default: Read Only (or strict approvals)
   - Used for mapping, reading docs, tracing integration points, and risk reviews.
   - Minimizes surprise by requiring explicit permission for commands/edits.

2. Temporary escalation: Agent (workspace-limited; avoid “full access”)
   - Used only when command-by-command approvals create excessive friction
     or when a single narrowly-scoped write is explicitly authorized.
   - Always paired with an explicit in-chat “no writes by default” contract.

3. Avoid: Agent (full access) unless explicitly required
   - Higher risk: expanded scope (outside workspace and/or network).

Rule of thumb:
- Safety-adjacent or behavior-changing work → prefer Read Only.
- Exporting a text artifact → consider one-time, tightly-scoped write.

---

## 4) One-Time “Write Artifact to Obsidian” Pattern

When Codex produces a useful analysis (e.g., an integration map), it may be exported to a Markdown file for Obsidian.

Safe pattern:
- Authorize exactly one write to one target path using a heredoc:
  - `cat > "<TARGET_PATH>" <<'EOF' ... EOF`

Required verification immediately after:
- `wc -l "<TARGET_PATH>"`
- `sed -n '1,40p' "<TARGET_PATH>"`

Constraints:
- No repo edits during artifact export.
- No network commands.
- No write commands beyond the single authorized heredoc.

This preserves a searchable, persistent artifact while avoiding broad edit permissions.

---

## 5) Operational Checklist (Quick)

Before a Codex session:
- Confirm current directory is the intended repo.
- Check Codex version: `codex --version`
- Prefer Read Only posture by default.

During the session:
- Use small, targeted reads.
- Prefer “unknown” over guessing.
- Never paste/log secrets (Wi-Fi passwords, tokens, private keys). Redact as `[REDACTED]`.

After the session:
- If any write was authorized, verify output and review diffs (`git diff`) before committing.
- Return to Read Only posture for continued work.
