#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: Scripts/export-chatgpt-heartloom-identity-zip.sh [options]

Options:
  --output-dir DIR    Final staging/output directory (default: vault 40_STAGING).
  --vault-path DIR    HeartloomVault root (default: /storage/emulated/0/Documents/HeartloomVault).
  --staging-dir DIR   Staging directory (default: <vault>/40_STAGING).
  --date YYYY-MM-DD   Override export date used in filename (default: UTC today).
  --force             Overwrite existing artifacts in staging.

Exports the ChatGPT-project Heartloom Identity zip artifact from repo-canonical sources.
USAGE
}

now_date() {
  date +%Y-%m-%d
}

now_ts() {
  date -u +%Y-%m-%dT%H:%M:%SZ
}

ensure_dir() {
  local path="$1"
  if [[ -z "${path}" ]]; then
    echo "Refusing to create empty path." >&2
    exit 1
  fi
  mkdir -p "${path}"
}

prompt_path() {
  local label="$1"
  local current="$2"

  echo "Missing expected ${label} path."
  echo "Current path: ${current:-<unset>}"
  read -r -p "Enter ${label} path (blank to abort): " response
  if [[ -z "${response}" ]]; then
    echo "Aborting because no ${label} path was provided." >&2
    exit 1
  fi
  echo "${response}"
}

output_dir=""
vault_path="/storage/emulated/0/Documents/HeartloomVault"
staging_dir=""
export_date=""
force="false"
tmp_root=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-dir)
      output_dir="${2:-}"
      shift 2
      ;;
    --vault-path)
      vault_path="${2:-}"
      shift 2
      ;;
    --staging-dir)
      staging_dir="${2:-}"
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

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "${repo_root}" || ! -d "${repo_root}" ]]; then
  repo_root="$(prompt_path "repo root" "${repo_root}")"
fi

manifest_path="${repo_root}/Scripts/chatgpt-heartloom-identity-export.manifest"

if [[ ! -d "${vault_path}" ]]; then
  vault_path="$(prompt_path "vault root" "${vault_path}")"
fi

if [[ -z "${staging_dir}" ]]; then
  staging_dir="${vault_path}/40_STAGING"
fi

if [[ -z "${output_dir}" ]]; then
  output_dir="${staging_dir}"
fi

if [[ ! -d "${output_dir}" ]]; then
  output_dir="$(prompt_path "staging/output directory" "${output_dir}")"
fi

ensure_dir "${output_dir}"

log_dir="${vault_path}/30_REFERENCE/termux-outputs/log-dump/$(now_date)"
ensure_dir "${log_dir}"

log_path="${log_dir}/chatgpt-heartloom-identity-export-$(date -u +%Y%m%dT%H%M%SZ).log"
exec > >(tee -a "${log_path}") 2>&1

wake_lock_active="false"
if command -v termux-wake-lock >/dev/null 2>&1; then
  termux-wake-lock
  wake_lock_active="true"
fi

tmp_root="${TMPDIR:-$HOME/.cache}"
ensure_dir "${tmp_root}"
tmp_dir="$(mktemp -d "${tmp_root%/}/chatgpt-heartloom-identity-export.XXXXXX")"

cleanup() {
  if [[ -n "${tmp_dir:-}" && -d "${tmp_dir}" ]]; then
    rm -rf "${tmp_dir}"
  fi
  if [[ "${wake_lock_active}" == "true" ]] && command -v termux-wake-unlock >/dev/null 2>&1; then
    termux-wake-unlock
  fi
}
trap cleanup EXIT

if [[ -z "${export_date}" ]]; then
  export_date="$(date -u +%Y-%m-%d)"
fi

zip_name="Heartloom-Identity-ChatGPT-${export_date}.zip"
final_zip_path="${output_dir}/${zip_name}"
final_provenance_path="${output_dir}/${zip_name%.zip}.provenance.txt"
pack_manifest_name="ChatGPT_Reference_Pack_Manifest.md"

if [[ ! -f "${manifest_path}" ]]; then
  echo "Manifest not found: ${manifest_path}" >&2
  exit 1
fi

if [[ -e "${final_zip_path}" && "${force}" != "true" ]]; then
  echo "Refusing to overwrite existing artifact: ${final_zip_path}" >&2
  echo "Re-run with --force to overwrite." >&2
  exit 1
fi

if [[ -e "${final_zip_path}" && "${force}" == "true" ]]; then
  rm -f "${final_zip_path}" "${final_provenance_path}"
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

tmp_zip_path="${tmp_dir}/${zip_name}"
tmp_provenance_path="${tmp_dir}/${zip_name%.zip}.provenance.txt"
tmp_pack_manifest_path="${tmp_dir}/${pack_manifest_name}"

commit_sha="$(git rev-parse HEAD)"
generated_utc="$(now_ts)"

cat > "${tmp_pack_manifest_path}" <<EOF
# ChatGPT Reference Pack Manifest (generated)

Purpose: Downstream Reference Pack export for ChatGPT project use.

Source repo: heartloom-identity
Commit SHA: ${commit_sha}
Exported UTC: ${generated_utc}
Export contract: Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md

Included classes:
- Core identity + governance docs
- Pack-contained navigation docs (README/INDEX/READING_ORDER)
- Identity alignment + navigation docs (source-alignment/eco-map/review/distinctions/source-input bridge)
- Selected Heartloom AI policy canon
- Consumer/bundle semantics docs
- Export-safe navigation metadata manifest

Excluded classes:
- Working Pack artifacts (logs, staging, local outputs)
- Sensitive local artifacts (vault metadata, key maps)
- Installer/maintainer internals and transition records
- Repo-level navigation not scoped to this Reference Pack
- Pointer shims replaced by canonical policy docs

Known intentional omissions:
- Repo README/INDEX
- Legacy pointer shims (Policies/Heartloom_AI_Operating_Protocol.md, Policies/Repo_Standards_Baseline.md)
EOF

(
  cd "${repo_root}"
  zip -X -@ "${tmp_zip_path}" < "${manifest_path}"
)

zip -X -j "${tmp_zip_path}" "${tmp_pack_manifest_path}"

cat > "${tmp_provenance_path}" <<EOF
exported_artifact=${zip_name}
source_repo=heartloom-identity
commit_sha=${commit_sha}
exported_utc=${generated_utc}
export_contract=Exports/ChatGPT_Project_Heartloom_Identity_Export_Contract_v1_0.md
manifest=Scripts/chatgpt-heartloom-identity-export.manifest
EOF

staged_zip_tmp="${output_dir}/.${zip_name}.tmp"
staged_provenance_tmp="${output_dir}/.${zip_name%.zip}.provenance.txt.tmp"

cp "${tmp_zip_path}" "${staged_zip_tmp}"
cp "${tmp_provenance_path}" "${staged_provenance_tmp}"
mv "${staged_zip_tmp}" "${final_zip_path}"
mv "${staged_provenance_tmp}" "${final_provenance_path}"

unzip -t "${final_zip_path}"

size_bytes="$(stat -c "%s" "${final_zip_path}")"
mtime="$(stat -c "%y" "${final_zip_path}")"

cat <<EOF
Exported ChatGPT Heartloom Identity zip:
- filename: ${zip_name}
- size_bytes: ${size_bytes}
- mtime: ${mtime}
- output_dir: ${output_dir}
- zip_path: ${final_zip_path}
- provenance_path: ${final_provenance_path}
- pack_manifest: ${pack_manifest_name}
- log_path: ${log_path}
EOF

# export-chatgpt-heartloom-identity-zip.sh EOF
