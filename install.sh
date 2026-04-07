#!/usr/bin/env bash
# install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_ROOT="/storage/emulated/0/Documents/HeartloomVault/00_Identity"
DRY_RUN=0

usage() {
  cat <<'USAGE'
Usage: ./install.sh [--dry-run|-n] [--help|-h]

Installs in-scope markdown docs from this repo into:
  /storage/emulated/0/Documents/HeartloomVault/00_Identity/

Options:
  --dry-run, -n   Show planned actions only (no filesystem writes)
  --help, -h      Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run|-n)
      DRY_RUN=1
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

run_mkdir "$DEST_ROOT"
run_mkdir "$DEST_ROOT/Heartloom-AI-Policies"

CREATED_COUNT=0
UPDATED_COUNT=0
SKIPPED_COUNT=0
SCANNED_COUNT=0

while IFS= read -r -d '' source_file; do
  file_name="$(basename "$source_file")"
  destination_file="$DEST_ROOT/$file_name"
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
  destination_file="$DEST_ROOT/$relative_path"
  SCANNED_COUNT=$((SCANNED_COUNT + 1))
  copy_or_update "$source_file" "$destination_file" "$relative_path"
done < <(build_file_list "$SCRIPT_DIR/Heartloom-AI-Policies" 1)

echo
echo "[SUMMARY] scanned=$SCANNED_COUNT created=$CREATED_COUNT updated=$UPDATED_COUNT skipped=$SKIPPED_COUNT"
echo "[SUMMARY] mode=sync-copy-upsert-without-prune"
echo "[SUMMARY] no-deletes-performed=true"

# install.sh EOF
