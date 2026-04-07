# Memory Migration Map (Export 2026-02-02 → Policies + Refactored Memories)

> Goal: Ensure every item from the original “exact export” is preserved either
> (a) as a compact refactored global memory, or (b) in vault policy documents.

## Legend

- GM-v2 = `global-memories-refactored-set-v2.0.md`
- POL-OP = `heartloom-ai-operating-protocol-v1.0.md`
- POL-TX = `termux-and-shell-policy-v1.0.md`
- POL-GH = `github-and-codex-pr-first-policy-v1.0.md`
- POL-REPO = `repo-standards-baseline-v1.0.md`
- POL-ZIP = `zip-inspection-and-artifact-contract-v1.0.md`

## Mapping (by original memory number ranges)

### Personal/user context
- Original #1, #3, #4, #5, #19 → GM-v2 (items 1–2)
- Original #2 (data storage specifics) → intentionally not kept in global memory (staleness risk). Best stored in a vault note when active.

### Operating protocol, anchors, authority, drift, stop rules
- Original #6, #7, #8, #9, #10, #12, #16, #23, #26, #31, #33, #34, #48, #50, #54, #55, #62, #63, #64, #71 → POL-OP + GM-v2 (items 3–7)

### Termux + formatting + resilience + download assumptions
- Original #11, #14, #18, #20, #53, #58, #59, #76, #80 → POL-TX + GM-v2 (items 8–14)

### Repo structure + CI tripwire + naming + packaging
- Original #35, #36, #37, #38, #39, #40, #42, #43, #45, #67, #68, #69, #70, #72, #73 → POL-REPO + GM-v2 (items 19–21)

### Zip inspection and artifact contract
- Original #17, #30, #41, #49, #52, #60, #61, #65, #66 → POL-ZIP + GM-v2 (items 12–13)

### GitHub + Codex workflow
- Original #44, #75, #77, #78, #89, #90, #91, #96, #97, #98, #99, #100 → POL-GH + GM-v2 (items 15–19)

### Dedupe/cleanup meta-rules + project specifics
- Original items that were duplicates or overly long policies are preserved as policies (above) and/or compact anchors (GM-v2).
