# Identity-Layer Output Contract: heartloom-identity (v1.0)

Status: **CANONICAL CONTRACT DEFINED**  
Type: Identity-layer/meta output reporting contract  
Scope: Reporting expectations for heartloom-identity and similar upstream ecosystem repos

## Purpose

Define the richer identity-layer output contract used for upstream ecosystem repos where architecture, canon, and downstream impact require explicit reporting. This contract complements (and does not replace) lighter downstream repo reporting.

## When to use this contract

Use this contract when:

- The repo is a canonical source for identity/policy docs.
- The slice affects architecture, canon, exports, or downstream behavior.
- The slice introduces or modifies workflow/ops expectations.

Use a lighter contract for normal downstream repos where architecture/canon impact is minimal.

## Identity-layer output contract (recommended)

1) touched files  
2) behavior changes  
3) architecture / canon impact  
4) state transition map  
5) downstream impact  
6) artifact / export impact  
7) what was NOT implemented  
8) verification status  
9) stop conditions encountered  
10) re-entry hint

### Field meanings

- **touched files:** exact list of files changed in the slice.  
- **behavior changes:** user-visible behavior changes (or explicitly “none”).  
- **architecture / canon impact:** changes to canonical boundaries, contracts, or architecture posture.  
- **state transition map:** before/after summary for key stateful changes.  
- **downstream impact:** effects on consumer repos or workflows.  
- **artifact / export impact:** effects on generated artifacts, exports, or staging outputs.  
- **what was NOT implemented:** explicit non-goals maintained in this slice.  
- **verification status:** tests/commands run and their status.  
- **stop conditions encountered:** any hard-stop triggers hit (or “none”).  
- **re-entry hint:** exact next commands or actions for resuming work.

## Lighter downstream contract (when appropriate)

For non-canonical downstream repos, a minimal contract is acceptable:

- touched files
- behavior changes
- what was NOT implemented
- verification status
- re-entry hint

## Workflow learnings (current canon)

- heartloom-identity uses a Codex-prompt-only workflow (no manual command blocks).
- PR preflight is required before starting new slice work.
- Per-PR auto-merge should be attempted when supported.
- ChatGPT export is a **Reference Pack** downstream artifact, distinct from canonical source and Working Pack outputs.

## Environment-specific operator notes

- In this environment, `/approvals` set to full access suppresses the edit-review prompt more effectively than repo config alone. This is not a universal guarantee.

Contracts/Identity_Layer_Output_Contract_v1_0.md EOF
