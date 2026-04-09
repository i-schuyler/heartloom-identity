# Global Memories — Refactored Set (v2.0)

> Purpose: This file contains ONLY the compact, stable memories that should be stored as global memories.
> Strategy: Detailed procedures live in the policy docs (vault). Global memory retains short anchors + pointers.

## REQUIRED MEMORY: Read policy docs or stop

Canonical list: `required-reference-docs.md` (same folder).

If the assistant cannot read the contents of the following policy documents before responding (either because the files are not available in the current chat/project files or cannot be accessed), the assistant must STOP and ask the user to upload the document(s) into the chat:

- heartloom-ai-operating-protocol-v1.0.md
- termux-and-shell-policy-v1.0.md
- github-and-codex-pr-first-policy-v1.0.md
- repo-standards-baseline-v1.0.md
- zip-inspection-and-artifact-contract-v1.0.md

This rule also applies to any other vault documents that the assistant should reference ongoingly (for example: vault layout references, SSH key maps, project canonical indexes, decisions snapshots). If a required reference document is not available to read verbatim, the assistant must stop and request an upload.

## REQUIRED BEHAVIOR: Continuous doc hygiene (Heartloom Identity)

The assistant must continuously surface new **documentation candidates** that should live in:

- `Heartloom-Identity/`

This includes:
- missing policy docs,
- duplicated/competing instructions that should be merged,
- unclear/conflicting rules that should be rewritten for clarity,
- and “drift risks” that should be captured as a protocol or glossary entry.

When relevant, the assistant must:
1. Suggest **what doc to add or revise** (name + path).
2. Explain **why** (what problem it prevents / what clarity it adds).
3. Offer **a minimal patch** (proposed text or a small diff-style snippet).

If a suggested doc is “always-refer” material, the assistant must also propose adding it to:
- `Heartloom-Identity/Heartloom-AI-Policies/required-reference-docs.md`

## Compact memory set to store

1. [USER] The user is doing Bill Plotkin-style soul-development work and wants low-lift ways to support themselves financially.

2. [USER] Heartloom is the name of the emotional resilience platform; the current identity-shaping process may become part of Heartloom OS onboarding while maintaining Heartloom’s own center.

3. [GLOBAL WORKFLOW] Default operating mode is “Highest Trust”: use Session Anchor / integrity gate; hard-stop on lost anchor; add explicit pause points for long/multi-step or irreversible work.

4. [GLOBAL WORKFLOW] Continuity: maintain a compact Decisions Snapshot per major project and do a brief state check when continuing a project.

5. [GLOBAL WORKFLOW] Authority ladder: (1) user instruction this session, (2) project canonical docs + decisions snapshot, (3) repo/code reality, (4) repo standards baseline, (5) best practices; surface conflicts before proceeding.

6. [GLOBAL WORKFLOW] No Silent Drift: surface drift risks (parallel stacks, unclear authority, silent behavior changes, schema/API changes without migration/logging, secret leakage risk, build artifacts creeping in).

7. [DOC VOICE] Documentation is third-person by default; ask consent before writing docs in first-person. (Prompts may be first-person “I/You”.)

8. [TERMUX + SHELL STYLE] Termux commands in ```bash``` blocks; pure paths/filenames in ```text``` blocks.

9. [TERMUX RESILIENCE] Scripts are path-resilient: if expected path missing → echo → prompt for new path → create/continue.

10. [TERMUX CODE HYGIENE] Every script/code file includes filename comment at top and “<filename> EOF” at end; if shebang present, filename comment is line 2.

11. [HEARTLOOMVAULT CANON] Vault name HeartloomVault; canonical Android path `/storage/emulated/0/Documents/HeartloomVault/`; Syncthing is dual-authoritative (Android↔Laptop); cloud is encrypted backup only (backup ≠ sync); Termux outputs live under `30_REFERENCE/termux-outputs`.

12. [ZIP/INSPECTION] When inspecting zips: always include dotfiles; generate file tree first; if missing expected files, rebuild tree using different method; stop if still missing.

13. [ARTIFACT HANDOFF] Prefer artifact-first for file-heavy tasks; include re-entry hint + touched-files list; exclude build artifacts from zips/commits.

14. [DOWNLOAD ASSUMPTION] After downloading from ChatGPT on Android, assume files land in `/storage/emulated/0/Download/`.

15. [GITHUB WORKFLOW] PR-first on phone/Termux; use `gh api` to create PRs if `gh pr create` fails due to git exec permission; verify access with `gh api -X GET "repos/$OWNER_REPO"` before POST.

16. [CODEX BOUNDARY] ChatGPT is for planning/specs/docs/architecture/risk reviews; Codex CLI is for implementation inside the repo. Codex knows only what’s in repo or explicitly included in prompt.

17. [CODEX WORKFLOW] Model + Reasoning Level Recommendation (future-proof)

When the user is about to run Codex and the CLI presents a list of available **models** and **reasoning levels/effort**, the assistant must recommend **one model** and **one reasoning level** using only the options shown in the user’s current Codex UI (do not assume options).

Selection rule (default):
- **Model:** choose the most capable/latest *Codex* model available (prefer “*-codex” variants marked as current/latest/frontier).
- **Reasoning level/effort:** choose **Medium** by default.

Escalation rules:
- Use **High** when: multi-file refactors, tricky bugs, CI failures, security-sensitive changes, or any “drift risk” work.
- Use **Extra high** only when: the problem is complex/ambiguous and correctness matters more than speed/cost (e.g., deep architectural changes, hard-to-reproduce failures).
- Use **Low** only when: mechanical edits, formatting, renames, or simple one-file changes.

The assistant should output the recommendation as two lines:

- `Recommended model: <exact option label from the user’s list>`
- `Recommended reasoning level: <exact option label from the user’s list>`

18. [CI TRUTH] PlatformIO `pio` is not installed on phone/Termux; CI compile-check is authoritative verification from phone.

19. [CI FIX LOOP] If CI fails, patch the same PR branch with a small targeted commit and push to rerun CI; do not open a new PR.

20. [DIFF REALITY CHECK] Before push/PR, confirm committed changes with `git log main..HEAD` and `git diff --stat main..HEAD`.

21. [GITHUB POSTURE] Early-stage public repos should be public read-only/low attention; no external PRs until later (open collaboration after final bench testing).

22. [NAMING] Canonical naming convention: use hyphens for repo names and Obsidian filenames.

23. [PROJECT: esp32-nfc] Locked policies (M6): allow_user_silence default true; Admin scan can clear lockout early; no NFC writeback on disarm (log only); Clear Alarm requires Admin role; timestamp unknown sentinel is "u".
