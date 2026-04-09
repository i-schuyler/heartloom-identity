# CI + Auto-Merge Policy: heartloom-identity (v1.0)

Status: **CANONICAL POLICY DEFINED (implementation/settings rollout not yet completed)**  
Type: CI, merge-gating, and branch-cleanup policy anchor  
Scope: Required check philosophy, merge readiness, auto-merge posture, and branch cleanup posture

## Purpose

Define the canonical policy for CI checks and merge automation behavior in `heartloom-identity` before implementation slices add workflows and/or GitHub settings.

This document defines policy intent only. It does **not** itself enable workflows, branch rulesets, auto-merge, or branch auto-delete settings.

## Implemented vs future state (required clarity)

- **Implemented now:** docs and `install.sh` exist in repo.
- **Implemented now:** lightweight CI workflow at `.github/workflows/ci.yml`.
- **Defined now for future use:** required checks, merge readiness criteria, auto-merge posture, and branch cleanup posture.
- **Not implemented yet:** enforcement wiring in GitHub settings/rulesets.

## Required check philosophy

`heartloom-identity` should start with lightweight, high-signal checks that protect quality without overbuilding automation.

Policy principles:

- Prefer fast checks that directly validate current repo risk areas.
- Keep initial baseline minimal, then expand only when justified.
- Require check pass before merge readiness.
- Avoid policy language that assumes checks are already enforced in settings.

## Initial check set (policy baseline)

CI implementation should include, at minimum:

1. **Shell syntax validation (required)**
   - Command: `bash -n install.sh`
2. **Shell linting (optional initially, preferred when available)**
   - Command: `shellcheck install.sh`
   - Posture: optional in early rollout; can become required in later slice.
3. **Lightweight docs/markdown validation (required)**
   - Scope: changed markdown files and core discovery docs.
   - Examples: broken-link scan and/or markdown structure sanity checks.

The exact tooling command for docs validation can be selected in implementation slices, but the policy requirement is that docs checks remain lightweight and reliable.

## Merge readiness criteria

A PR is merge-ready when all of the following are true:

- Required checks defined by active policy/ruleset are green.
- Scope matches declared slice intent (no unrelated implementation drift).
- Required output contract (if specified in PR/prompt process) is satisfied.
- No unresolved blocking review concerns remain.

Optional checks can inform quality but must be clearly marked optional until explicitly promoted to required.

## Auto-merge posture

- Auto-merge is **allowed** for this repo, but only after required merge criteria are satisfied.
- Auto-merge must not bypass required checks or required review gates.
- Auto-merge enablement remains a GitHub repository/ruleset setting decision, not a docs-only action in this slice.

## Remote branch auto-delete posture

- Preferred posture: enable GitHub “automatically delete head branches” after merge.
- This is a GitHub setting preference and may be rolled out in a separate implementation/admin step.
- Policy intent is to reduce stale remote branches after successful merges.

## Local branch cleanup posture

- Local branch cleanup remains manual by default.
- Recommended local practice after merge:
  - `git checkout <main-branch>`
  - `git pull --ff-only`
  - `git branch -d <merged-branch>`
- Local cleanup automation is out of scope unless explicitly added in a future slice.

## Repo files vs GitHub settings distinction

- **Repo-file layer:** policy docs and workflow definitions in version control.
- **GitHub settings layer:** branch protection/rulesets, required status checks, auto-merge toggle, remote auto-delete toggle.

This policy anchors both layers conceptually but does not claim either layer is fully configured yet.

## Non-goals in this slice

- No GitHub settings/ruleset changes.
- No installer code changes.
- No authority changes.
- No bundle tooling changes.
- No session-pack automation.
- No repo restructuring.

Policies/CI_Auto_Merge_Policy_v1_0.md EOF
