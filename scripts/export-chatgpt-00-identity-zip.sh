#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[DEPRECATED] scripts/export-chatgpt-00-identity-zip.sh is a temporary compatibility alias."
echo "[DEPRECATED] Use scripts/export-chatgpt-heartloom-identity-zip.sh instead."

exec "${script_dir}/export-chatgpt-heartloom-identity-zip.sh" "$@"
