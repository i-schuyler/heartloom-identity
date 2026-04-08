# Repo Ecosystem Map: heartloom-identity (v1.0)

Status: **CANONICAL MAP DEFINED**  
Type: Repo ecosystem navigation and layer map  
Scope: Public doorway, upstream source layer, identity layer, and structural/operational downstream repos

## Purpose

Provide a fast, newcomer-readable map of where [`heartloom-identity`](https://github.com/i-schuyler/heartloom-identity) sits in the Heartloom repo ecosystem.

## Evidence Block

- [`heartloom-source`](https://github.com/i-schuyler/heartloom-source) is the upstream source-text container for Heartloom meaning, law, and orientation.
- [`heartloom-identity`](https://github.com/i-schuyler/heartloom-identity) is the downstream translation/inheritance layer for ecosystem shaping and implementation-facing structure.
- Structural and operational consumer repos exist downstream and should be navigable from identity without duplicating source canon.

## Public Doorway

- GitHub owner/org doorway: [`i-schuyler`](https://github.com/i-schuyler)

## Key Repo Anchors

- Upstream source: [`heartloom-source`](https://github.com/i-schuyler/heartloom-source)
- Identity translation layer: [`heartloom-identity`](https://github.com/i-schuyler/heartloom-identity)
- Structural downstream repo: [`heartloom-vaultmeta`](https://github.com/i-schuyler/heartloom-vaultmeta)
- Operational downstream repo: [`termux-utils`](https://github.com/i-schuyler/termux-utils)

## Layered Ecosystem Map

```text
Public Doorway
  └─ i-schuyler (GitHub account/org)
      ├─ Upstream Source Layer
      │   └─ heartloom-source
      │       (closest available source texts;
      │        meaning/law/orientation north-star)
      │
      ├─ Downstream Identity / Inheritance Layer
      │   └─ heartloom-identity
      │       (translation into repo/ecosystem/workflow/
      │        pack/export/consumer structures)
      │
      └─ Structural / Operational Downstream Repos
          ├─ heartloom-vaultmeta
          └─ termux-utils

Non-repo ecosystem elements flowing from identity layer:
  - Reference Pack (consumer-facing stable artifact view)
  - Working Pack (maintainer-facing mutable execution layer)
```

## Quick Navigation

- If you need source meaning/law/orientation, start in `heartloom-source`.
- If you need inheritance/workflow/pack/export/ecosystem shaping, start in `heartloom-identity`.
- If you need consumer/operational implementation, navigate to downstream repos.

Repo_Ecosystem_Map_heartloom_identity_v1_0.md EOF
