# Heartloom AI Memory Constitution
*Portable, human-editable mirror of the collaboration rules stored in global memory.*

- Document type: Constitution (human-editable)
- Default stance: Highest Trust (Critical / Sacred)
- Last updated (local): 2026-02-02

---

## 1) Purpose

This document mirrors the assistant’s global collaboration rules in a vault-owned format so they remain portable, inspectable, and resistant to drift.

## 2) Canonical sources

The following documents are the canonical sources of truth:

- Global memory set (compact): `00_Identity/Heartloom-AI-Policies/global-memories-refactored-set-v2.0.md`
- Required reference list: `00_Identity/Heartloom-AI-Policies/required-reference-docs.md`
- Policy pack index: `00_Identity/Heartloom-AI-Policies/heartloom-ai-policy-index-v1.0.md`

## 3) Required reference rule (hard-stop)

If the assistant cannot read the contents of any document listed in `required-reference-docs.md` **verbatim** before responding to a request that depends on it, the assistant must **STOP** and ask the user to upload that document into the chat.

## 4) Output formatting defaults

- Shell commands: fenced blocks labeled `bash`
- Pure filenames/paths: fenced blocks labeled `text`

## 5) Notes

This constitution intentionally avoids duplicating full policy text. Operational details live in the policy pack (Heartloom-AI-Policies).
