#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/export-chatgpt-00-identity-zip.sh [--output-dir DIR] [--date YYYY-MM-DD] [--force]

Exports the ChatGPT-project 00_Identity zip artifact from repo-canonical sources.
USAGE
}

output_dir=""
export_date=""
force="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-dir)
      output_dir="${2:-}"
      shift 2
      ;;
    --date)
      export_date="${2:-}"
      shift 2
      ;;
    --force)
      force="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown arg: $1" >&2
      usage
      exit 1
      ;;
  esac
done

repo_root="$(git rev-parse --show-toplevel)"
manifest_path="${repo_root}/scripts/chatgpt-00-identity-export.manifest"

if [[ -z "${output_dir}" ]]; then
  output_dir="${repo_root}/exports/chatgpt-00-identity"
fi

if [[ -z "${export_date}" ]]; then
  export_date="$(date -u +%Y-%m-%d)"
fi

zip_name="00_Identity-ChatGPT-${export_date}.zip"
zip_path="${output_dir}/${zip_name}"

if [[ ! -f "${manifest_path}" ]]; then
  echo "Manifest not found: ${manifest_path}" >&2
  exit 1
fi

mkdir -p "${output_dir}"

if [[ -e "${zip_path}" && "${force}" != "true" ]]; then
  echo "Refusing to overwrite existing artifact: ${zip_path}" >&2
  echo "Re-run with --force to overwrite." >&2
  exit 1
fi

missing_files=()
while IFS= read -r line; do
  [[ -z "${line}" ]] && continue
  if [[ ! -f "${repo_root}/${line}" ]]; then
    missing_files+=("${line}")
  fi
done < "${manifest_path}"

if [[ ${#missing_files[@]} -gt 0 ]]; then
  echo "Manifest references missing files:" >&2
  printf '  - %s\n' "${missing_files[@]}" >&2
  exit 1
fi

(
  cd "${repo_root}"
  zip -X -@ "${zip_path}" < "${manifest_path}"
)

provenance_path="${zip_path%.zip}.provenance.txt"
commit_sha="$(git rev-parse HEAD)"
generated_utc="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

cat > "${provenance_path}" <<EOF
exported_artifact=${zip_name}
source_repo=heartloom-identity
commit_sha=${commit_sha}
exported_utc=${generated_utc}
export_contract=ChatGPT_Project_00_Identity_Export_Contract_v1_0.md
manifest=scripts/chatgpt-00-identity-export.manifest
EOF

size_bytes="$(stat -c "%s" "${zip_path}")"
mtime="$(stat -c "%y" "${zip_path}")"

cat <<EOF
Exported ChatGPT 00_Identity zip:
- filename: ${zip_name}
- size_bytes: ${size_bytes}
- mtime: ${mtime}
- output_dir: ${output_dir}
- zip_path: ${zip_path}
- provenance_path: ${provenance_path}
EOF
