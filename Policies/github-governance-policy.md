# GitHub Governance Policy (Ecosystem-Wide)
Location: `Heartloom-Identity/`

## Purpose
This policy defines a single baseline governance standard for all repositories under the i-schuyler GitHub ecosystem. It also defines a per-project “Safety Appendix” pattern for safety-critical work (e.g., EV control, access control/security firmware).

## Scope
Applies to:
- All repositories owned by the i-schuyler GitHub account (public and private)
- Any future repositories created under i-schuyler (or later migrated into an organization)

Non-goals:
- Replacing per-project threat modeling
- Publishing secrets or sensitive operational details

---

## 1) Default Branch Policy (Baseline)
### 1.1 Branch naming (recommended)
- `main` is the default branch.
- Working branches: `feat/<kebab>`, `fix/<kebab>`, `docs/<kebab>`, `chore/<kebab>`.

### 1.2 Merge model (baseline)
- Changes land via Pull Request (PR), even for solo work.
- PRs should include:
  - Clear description of intent
  - What was tested / built
  - Any safety impact notes (if relevant)

### 1.3 CI checks (baseline)
- At minimum, the default CI must:
  - Build (or lint/test where applicable)
  - Fail on forbidden artifacts committed to the repo (e.g., `.pio/build`, `node_modules`, `dist`)

### 1.4 Enforcement levels (choose per repo)
This policy uses three enforcement levels:

**Level 0 — Discipline Only (current default for private repos)**
- PR workflow is followed by habit, not enforced by GitHub settings.
- CI runs and reports status, but merges can proceed without hard gates.

**Level 1 — Soft Enforcement**
- Protected branch rules are enabled where available.
- Require CI status checks on `main`.
- Direct pushes to `main` are discouraged/blocked.

**Level 2 — Hard Enforcement**
- Protected branches + required PR reviews (N approvals).
- CODEOWNERS required for sensitive paths.
- “Dismiss stale approvals” enabled (where available).
- Restrict who can push to `main`.

**Current posture (2026-01-30):**
- Private repos: Level 0 (Discipline + CI checks), until upgrade is justified.
- Releases: manual tagging (no auto-release on merge).

---

## 2) Secret Boundary Policy (Baseline)
### 2.1 “Secrets” definition
Secrets include (non-exhaustive):
- API tokens, access keys, OAuth tokens
- Wi-Fi passwords, device credentials
- Private keys, certificates, signing keys
- OTA auth materials, provisioning secrets
- Any “live system” IPs/ports/credentials not meant for public disclosure

### 2.2 Prohibited locations
Secrets must never be committed to:
- Repo files (any branch)
- CI logs
- GitHub Issues/PR descriptions
- Release notes or artifacts

### 2.3 Allowed locations (recommended)
- Local developer machine secret stores (password manager)
- CI secret managers (GitHub Secrets / environment secrets) when needed
- Encrypted vault notes (only if absolutely necessary; prefer password manager)

### 2.4 Redaction standard
When documentation must reference sensitive materials, it uses placeholders:
- `[REDACTED]` for actual secret values
- Example-only “fake” placeholders that cannot be mistaken for real secrets

---

## 3) CI Spend Policy (Baseline)
Goal: keep spend at **$0** by default.

### 3.1 Default stance
- Prefer public repos for heavy CI where safe (public CI is typically free on standard runners).
- For private repos, keep workflows minimal and avoid paid overages.

### 3.2 Workflow triggers (recommended)
- CI runs on:
  - `pull_request` to `main`
  - (optional) `push` to feature branches only if needed

### 3.3 Governance
- Avoid workflows that run on every push to every branch unless the repo demands it.
- Avoid secrets in CI logs; prefer masked secrets and careful echo discipline.

---

## 4) Release Contract (Firmware and Build Artifacts)
Releases are produced intentionally. They must be reproducible, name-stable, and hash-verified.

### 4.1 Current release posture (2026-01-30)
- Releases are created by **manual tags**.
- CI may build on PRs, but does not publish releases automatically unless explicitly enabled per repo.

### 4.2 Artifact naming contract (baseline)
Artifact filenames include:
- project name
- semantic version (or tag)
- target/platform (if applicable)

Example:
- `ev-autopilot_v0.12.0_evtv-esp32.bin`
- `security-system_v1.0.0_esp32.bin`

### 4.3 Required metadata for firmware artifacts
Each firmware release must include:
- SHA-256 checksum file (e.g., `SHA256SUMS.txt`)
- Build environment note:
  - toolchain (PlatformIO/ESP-IDF), version
  - board/target environment name
- Git commit SHA that produced the artifact
- Release notes summarizing changes and safety impact

---

## 5) Per-Project Safety Appendix (Required for safety-critical projects)
Each safety-critical project maintains a short appendix file in its repo (or vault) that answers:

1) **Public surface area**
- What can be public without increasing exploitability?
- What must remain private and why?

2) **Threat model (lightweight)**
- Who is the attacker?
- What are the likely attack paths?
- What is the worst credible failure?

3) **Safety invariants**
- What must never happen (e.g., unsafe actuation, bypassed auth)?
- What are the fail-safe defaults?

4) **Logging policy**
- What is logged?
- What is explicitly NOT logged (UIDs, secrets, key material)?

5) **Update/OTA policy**
- Who can update?
- How is integrity verified?
- What happens on update failure?

Template filename (recommended):
- `docs/safety-appendix.md`

---

## 6) Upgrade Criteria for Enforcement (when to “need” branch protection + required reviews)
Branch protection + required reviews are warranted when any of these are true:

- The repo is **safety-critical** (vehicle control, access control) and a bad merge can cause physical/security harm.
- The repo is edited from **multiple devices** and mistakes are more likely (mobile + laptop + coworker).
- There is **release pressure** (frequent releases, demos, field updates) where “oops” merges are costly.
- There is **future collaborator onboarding** planned (even if not immediate).
- The repo has **complex CI** where passing checks should be mandatory before merge.
- The repo contains or touches **security boundaries** (auth, OTA, key handling, event logs).

If none apply and the repo is low-risk, Level 0 can be acceptable short-term.

---

## Review cadence
- This policy is revisited quarterly, or after any incident (secret leakage, unsafe regression, costly release mistake).
