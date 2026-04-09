# Tools Shortlist v1.0
*Lightweight, living shortlist of preferred tools across phone (Termux), laptop, and VPS.*

- Owner context: HeartloomVault ecosystem (Obsidian + Termux + GitHub workflows)
- Preference: free/open-source tools by default; paid tools only when clearly necessary
- Last updated (local): 2026-01-27

---

## Purpose

This note captures a small set of “default picks” for common tasks (navigation, search, backups, scripting, CI, security hygiene). It is intended to reduce decision fatigue and keep tooling consistent across:
- Android phone (Termux)
- Laptop
- VPS

This shortlist is not exhaustive. It should remain small and high-leverage.

---

## Core principles

- **Offline-first** by default; cloud is optional and treated as backup/sync depending on project canon.
- **Reproducible** workflows: scripts, manifests, and small diffs over manual one-offs.
- **No silent drift**: prefer tooling that makes change visible (logs, diffs, CI tripwires).
- **Secret hygiene**: avoid pasting secrets; prevent secret leakage into logs/repos.

---

## Phone (Android + Termux)

### Must-have foundation
- **Termux + tmux** — durable sessions; long-running tasks without losing context.
- **git** — repo work and patching.
- **openssh** — SSH keys, remote ops, SFTP.

### Navigation and search (high leverage)
- **ripgrep (rg)** — fast text search across repos/notes.
- **fd** — fast file finding.
- **fzf** — interactive fuzzy finder; pairs well with rg/fd.
- **bat** — readable previews (syntax highlighting).
- **tree** — quick directory trees (helpful for artifact contracts).

### Data shaping / inspection
- **jq** — JSON inspection/patching (configs, status outputs, API payloads).
- **yq** — YAML inspection/patching (CI workflows, configs).

### Packaging and backups
- **zip** — portable zips for “zip tennis” style loops.
- **rclone** — cloud remotes (backup targets).
- **age** — modern file encryption (passphrase mode for phone workflows).

### QA and script discipline
- **shellcheck** — static checks for bash scripts.
- **shfmt** — consistent shell formatting.

---

## Laptop (general-purpose dev workstation)

### Baseline
- **git** + **gh** (GitHub CLI) — standard GitHub workflows.
- **Codex CLI + GitHub CI** — default implementation workflow for GitHub work (small diffs, CI tripwires).

### Search and navigation
- **ripgrep (rg)**, **fd**, **fzf**, **bat**, **tree** — consistent muscle memory across devices.

### Build/runtime toolchains (as needed by project)
- **Python** — scripting, automation, reports.
- **Node.js** — Tooling/UIs only when required by project canon.
- **PlatformIO / ESP-IDF** — embedded firmware workflows when applicable.

### Secret scanning (CI-friendly)
- **gitleaks** or **trufflehog** — prevent accidental secret commits (ideally in CI).

---

## VPS (10 GB)

### Remote access and hardening
- **openssh** — key-based auth; explicit config.
- **ufw** (or distro firewall) — minimal firewall policy.
- **fail2ban** — basic brute-force mitigation where appropriate.
- **logrotate** — keep logs bounded and predictable.

### Web/service stack (choose minimal, fit-for-purpose)
- **Caddy** — simple HTTPS-by-default reverse proxy and static hosting.
- **nginx** — alternative when fine-grained proxying is needed.

### Backups
- **restic** (preferred) or **borg** — encrypted, deduplicated backups.
- **rclone** — push encrypted backups off-host.

### Secure remote mesh (optional, when beneficial)
- **WireGuard** or **Tailscale** — safe remote access without exposing ports widely.

---

## Cross-device transfer

- **Syncthing** — dual-authoritative sync between devices where appropriate.
- **SFTP / scp** — explicit one-off transfers.
- **croc** — quick ad-hoc transfers over relay when networks are weird.

---

## Obsidian (HeartloomVault)

- **Templater** — repeatable note creation and maintenance.
- **CSS snippets** — accessibility + intentional UI states (e.g., night mode snippet).
- **Outline** — quick header navigation (mobile-friendly).

---

## Tracked defaults and future suggestions

The assistant should:
- suggest tool additions only when they reduce friction or improve safety/reproducibility,
- prefer free/open-source options by default,
- include reasoning for recommendations,
- keep this shortlist small (avoid tool sprawl).

---

## Appendix: installed in (Termux)

Only install what is actually needed; the goal is a small, stable base.

```txt
pkg install -y git openssh tmux ripgrep fd fzf bat jq yq zip rclone age shellcheck shfmt tree
```
