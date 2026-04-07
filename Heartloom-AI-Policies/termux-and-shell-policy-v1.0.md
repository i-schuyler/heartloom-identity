# Termux and Shell Policy (v1.0)

## Purpose

This policy defines Termux conventions and shell-output practices so commands are copy/paste friendly and artifacts remain Obsidian-readable.

## Canonical Termux outputs location

All Termux automation outputs should be written as Markdown files under the canonical daily log root:

- `/storage/emulated/0/Documents/HeartloomVault/30_REFERENCE/termux-outputs/log-dump/YYYY-MM-DD/`

Scripts should create the day folder if it does not exist.

## Command and path formatting

- Shell commands: fenced blocks labeled `bash`.
- Pure filenames/paths: fenced blocks labeled `text`.

## Canonical download assumption (Android)

After downloading a file from ChatGPT on Android, assume it lands in:

- `/storage/emulated/0/Download/`

## Long output handling

If output is longer than a phone screen:

- Write it to a `.md` file under `termux-outputs` instead of pasting inline.

## Path resilience rule (non-negotiable)

If an expected file or directory is missing, scripts should:

1. Echo what is missing
2. Prompt for a new path
3. Create the path (if needed) and continue

## Script boundary markers (non-negotiable)

Every script/code file must include:

- Filename comment at top
- Filename EOF marker at bottom

Shebang exception:

- Line 1: shebang
- Line 2: filename comment
- Last line: `<filename> EOF`

## Backup ≠ sync

- Syncthing is live sync (dual-authoritative Android ↔ laptop).
- Cloud is encrypted backup only (zip → age → rclone), never a live sync target.
