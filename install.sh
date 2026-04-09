#!/usr/bin/env bash
# install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_ROOT="/storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity"
LEGACY_DEST_ROOT="/storage/emulated/0/Documents/HeartloomVault/00_Identity"
CODEX_GLOBAL_SOURCE="$SCRIPT_DIR/tooling/codex-global"
CODEX_GLOBAL_DEST="${HOME}/.codex"
DRY_RUN=0
MODE="vault"
LEGACY_ALIAS_MODE="auto"

usage() {
  cat <<'USAGE'
Usage: ./install.sh [--dry-run|-n] [--codex-global] [--legacy-alias] [--no-legacy-alias] [--help|-h]

Default (vault sync): installs in-scope markdown docs from this repo into:
  /storage/emulated/0/Documents/HeartloomVault/Heartloom-Identity/

Temporary compatibility behavior (phase 1 rename):
  - auto mode (default): if legacy /00_Identity/ exists, sync to it as alias
  - --legacy-alias: always sync/create legacy /00_Identity/ alias path
  - --no-legacy-alias: disable legacy alias sync

Codex-global mode:
  ./install.sh --codex-global
  Installs tooling/codex-global/{AGENTS.md,config.toml} into ~/.codex/

Options:
  --dry-run, -n   Show planned actions only (no filesystem writes)
  --codex-global  Install source-controlled Codex globals into ~/.codex/
  --legacy-alias  Force sync/create legacy /00_Identity/ compatibility alias
  --no-legacy-alias  Disable legacy /00_Identity/ compatibility alias sync
  --help, -h      Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run|-n)
      DRY_RUN=1
      ;;
    --codex-global)
      MODE="codex-global"
      ;;
    --legacy-alias)
      LEGACY_ALIAS_MODE="always"
      ;;
    --no-legacy-alias)
      LEGACY_ALIAS_MODE="off"
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done

run_mkdir() {
  local dir_path="$1"
  if [[ -d "$dir_path" ]]; then
    return
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[DRY-RUN] mkdir -p '$dir_path'"
    return
  fi

  mkdir -p "$dir_path"
  echo "[CREATE-DIR] $dir_path"
}

copy_or_update() {
  local source_path="$1"
  local destination_path="$2"
  local relative_path="$3"

  if [[ ! -e "$destination_path" ]]; then
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "[DRY-RUN][CREATE] $relative_path"
    else
      cp "$source_path" "$destination_path"
      echo "[CREATE] $relative_path"
    fi
    CREATED_COUNT=$((CREATED_COUNT + 1))
    return
  fi

  if cmp -s "$source_path" "$destination_path"; then
    echo "[SKIP] $relative_path"
    SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
    return
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[DRY-RUN][UPDATE] $relative_path"
  else
    cp "$source_path" "$destination_path"
    echo "[UPDATE] $relative_path"
  fi
  UPDATED_COUNT=$((UPDATED_COUNT + 1))
}

build_file_list() {
  local root_dir="$1"
  local max_depth="$2"

  find "$root_dir" -mindepth 1 -maxdepth "$max_depth" -type f -name '*.md' ! -name '.*' -print0 | sort -z
}

install_codex_global() {
  echo "[INFO] heartloom-identity installer (codex-global)"
  echo "[INFO] Source root: $CODEX_GLOBAL_SOURCE"
  echo "[INFO] Destination root: $CODEX_GLOBAL_DEST"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[INFO] Dry-run mode enabled (no writes)"
  fi

  if [[ ! -d "$CODEX_GLOBAL_SOURCE" ]]; then
    echo "[ABORT] Missing source directory: $CODEX_GLOBAL_SOURCE"
    exit 1
  fi

  run_mkdir "$CODEX_GLOBAL_DEST"

  CREATED_COUNT=0
  UPDATED_COUNT=0
  SKIPPED_COUNT=0
  SCANNED_COUNT=0

  local source_file
  local destination_file

  source_file="$CODEX_GLOBAL_SOURCE/AGENTS.md"
  destination_file="$CODEX_GLOBAL_DEST/AGENTS.md"
  if [[ ! -f "$source_file" ]]; then
    echo "[ABORT] Missing source file: $source_file"
    exit 1
  fi
  SCANNED_COUNT=$((SCANNED_COUNT + 1))
  copy_or_update "$source_file" "$destination_file" "AGENTS.md"

  source_file="$CODEX_GLOBAL_SOURCE/config.toml"
  destination_file="$CODEX_GLOBAL_DEST/config.toml"
  if [[ ! -f "$source_file" ]]; then
    echo "[ABORT] Missing source file: $source_file"
    exit 1
  fi
  SCANNED_COUNT=$((SCANNED_COUNT + 1))
  copy_or_update "$source_file" "$destination_file" "config.toml"

  echo
  echo "[SUMMARY] scanned=$SCANNED_COUNT created=$CREATED_COUNT updated=$UPDATED_COUNT skipped=$SKIPPED_COUNT"
  echo "[SUMMARY] mode=codex-global-sync-copy-upsert-without-prune"
  echo "[SUMMARY] no-deletes-performed=true"
}

sync_markdown_docs_to_root() {
  local destination_root="$1"
  local summary_label="$2"

  run_mkdir "$destination_root"
  run_mkdir "$destination_root/Heartloom-AI-Policies"

  CREATED_COUNT=0
  UPDATED_COUNT=0
  SKIPPED_COUNT=0
  SCANNED_COUNT=0

  while IFS= read -r -d '' source_file; do
    file_name="$(basename "$source_file")"
    destination_file="$destination_root/$file_name"
    SCANNED_COUNT=$((SCANNED_COUNT + 1))
    copy_or_update "$source_file" "$destination_file" "$file_name"
  done < <(build_file_list "$SCRIPT_DIR" 1)

  if [[ ! -d "$SCRIPT_DIR/Heartloom-AI-Policies" ]]; then
    echo "[ABORT] Missing source directory: $SCRIPT_DIR/Heartloom-AI-Policies"
    exit 1
  fi

  while IFS= read -r -d '' source_file; do
    file_name="$(basename "$source_file")"
    relative_path="Heartloom-AI-Policies/$file_name"
    destination_file="$destination_root/$relative_path"
    SCANNED_COUNT=$((SCANNED_COUNT + 1))
    copy_or_update "$source_file" "$destination_file" "$relative_path"
  done < <(build_file_list "$SCRIPT_DIR/Heartloom-AI-Policies" 1)

  echo
  echo "[SUMMARY][$summary_label] scanned=$SCANNED_COUNT created=$CREATED_COUNT updated=$UPDATED_COUNT skipped=$SKIPPED_COUNT"
  echo "[SUMMARY][$summary_label] mode=sync-copy-upsert-without-prune"
  echo "[SUMMARY][$summary_label] no-deletes-performed=true"
}

install_vault_sync() {
  echo "[INFO] heartloom-identity installer"
  echo "[INFO] Destination root: $DEST_ROOT"
  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[INFO] Dry-run mode enabled (no writes)"
  fi

  if [[ ! -d "$DEST_ROOT" ]]; then
    echo "[WARN] Expected destination path is missing: $DEST_ROOT"
    if [[ -t 0 ]]; then
      read -r -p "Create this canonical destination path and continue? [Y/n] " create_reply
      create_reply="${create_reply:-Y}"
      if [[ "$create_reply" =~ ^[Nn]$ ]]; then
        echo "[ABORT] Destination path missing and creation declined."
        exit 1
      fi
    else
      echo "[INFO] Non-interactive mode: creating canonical destination path and continuing."
    fi
  fi

  sync_markdown_docs_to_root "$DEST_ROOT" "canonical"

  local sync_legacy_alias=0
  case "$LEGACY_ALIAS_MODE" in
    always)
      sync_legacy_alias=1
      ;;
    auto)
      if [[ -d "$LEGACY_DEST_ROOT" ]]; then
        sync_legacy_alias=1
      fi
      ;;
    off)
      sync_legacy_alias=0
      ;;
  esac

  if [[ "$sync_legacy_alias" -eq 1 ]]; then
    echo "[INFO] Temporary compatibility alias sync enabled: $LEGACY_DEST_ROOT"
    sync_markdown_docs_to_root "$LEGACY_DEST_ROOT" "legacy-00_Identity-alias"
  else
    echo "[INFO] Temporary compatibility alias sync skipped: $LEGACY_DEST_ROOT"
  fi
}

if [[ "$MODE" == "codex-global" ]]; then
  install_codex_global
else
  install_vault_sync
fi

# install.sh EOF
