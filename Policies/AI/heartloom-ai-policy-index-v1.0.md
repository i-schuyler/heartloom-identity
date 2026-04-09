# Heartloom AI Policy Index (v1.0)

> Purpose: These policies replace long-form “global memories” by moving detailed operational guidance into the HeartloomVault where it can be read verbatim when needed.
> Scope: Applies across projects unless a project’s canonical docs override.

## Canonical storage location

- Vault: `/storage/emulated/0/Documents/HeartloomVault/`
- Folder: `Heartloom-Identity/Policies/AI/`

## Policy documents in this pack

1. **heartloom-ai-operating-protocol-v1.0.md**  
   High-trust collaboration contract: anchors, authority order, drift rules, stop conditions.

2. **termux-and-shell-policy-v1.0.md**  
   Termux behaviors, command formatting, resilience rules, download assumptions, long-output handling.

3. **github-and-codex-pr-first-policy-v1.0.md**  
   PR-first workflow, Codex boundary, CI-as-truth on phone, `gh api` fallback, and required clipboard-return rule that mirrors user output contracts (with plain printed fallback when clipboard tooling is unavailable).

4. **repo-standards-baseline-v1.0.md**  
   Default repo structure baseline, minimal CI tripwire, naming conventions, packaging discipline.

5. **zip-inspection-and-artifact-contract-v1.0.md**  
   Inspection depth levels, dotfile inclusion, touched-files listing, exclusions, re-entry hints.
6. **authority-boundary-map-v1.0.md**
   Authority ladder + intake sequence + global “you/we” interpretation + cross-project visibility limits (approved)

## Ongoing vault references (commonly required)

These are “always-refer” documents (when present) that should be treated as authoritative inputs:

- `Heartloom-Identity/Policies/Heartloom_AI_Operating_Protocol.md` (if it exists as the living, human-edited canonical manual)
- `30_REFERENCE/Policies/Repo_Standards_Baseline.md` (if you maintain a vault-level baseline there)
- `VaultMeta - File Tree.md` (authoritative vault layout)
- `VaultMeta - Directory Blocks.md` (authoritative semantic folder map)
- `GitHub_SSH_Key_Locations_Map_AUTHORITATIVE.md` (authoritative SSH key map)

If any of these exist and diverge from these policies, the vault documents win.

## How to use

- Routine work: rely on `global-memories-refactored-set-v2.0.md`.
- Implementation detail: open the relevant policy doc and follow it verbatim.
- Conflicts: apply the Authority Order in the operating protocol.

## Discoverability notes

- Clipboard-return canon: `github-and-codex-pr-first-policy-v1.0.md` requires clipboard payloads to match any prompt-defined output contract exactly, including the full numbered range generated in that slice (not capped at 5), with plain printed fallback when clipboard tooling is unavailable.
- Consumer integration canon: `Reference/Consumer_Integration_Model_v1_0.md` defines near-term consumer snapshot usage, long-term bundle aspirations, local extension/override boundaries, and upstream change proposal path.
