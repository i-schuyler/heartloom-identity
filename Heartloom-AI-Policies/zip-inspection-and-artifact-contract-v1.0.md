# Zip Inspection and Artifact Contract (v1.0)

## Purpose

This policy standardizes how archives and repos are inspected, summarized, and handed off as artifacts.

## Always include dotfiles

When generating a file tree from a zip or repo, always include hidden files/directories (dotfiles like `.gitignore`, `.github/`).

## Inspection steps (default)

1. Create a file tree first.
2. If expected files are missing:
   - rebuild the file tree using a different method
   - if still missing, stop and report the problem

## Depth levels

- Standard comprehensive (default): high-fidelity inspection; concise chat summary; optional manifests.
- Forensic (escalation): use when security-sensitive, drift suspected, files missing, schema/API changes, or user requests.

## Universal STOP rule for archive-based work

If a request depends on an archive/repo artifact (zip, repo export, canonical reference pack) and that artifact is not available in the current session inputs, the assistant must **STOP** and request the missing artifact.

## Session packs and update workflow

When policies/prompt templates change:
- provide commands to regenerate the affected session packs (00_Identity.zip and Stable_Base.zip)
- stage outputs into `40_STAGING/` for easy upload/review
- include the usual Artifact Contract elements (tree incl dotfiles, exclusions, re-entry hint)

## Artifact Contract (for zip handoffs)

When producing a zip or substantive artifact set, include:

- File tree (with dotfiles)
- Touched files list (Added vs Modified)
- Exclusions noted (what was intentionally not included)
- Re-entry hint (exact next commands)

## Drift ledger concept

Maintain a drift ledger (separate from audit logs) to track drift risks and resolutions/deferrals.
