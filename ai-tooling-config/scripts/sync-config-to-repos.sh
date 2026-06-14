#!/usr/bin/env bash
# Copy shared AI config into component repos (run from workspace root)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CONFIG="${ROOT}/ai-tooling-config"

GLOBAL_INSTRUCTIONS=(
  customer-portal-devops.instructions.md
  global-mcp.instructions.md
)

copy_global_instructions() {
  local target="$1/.github/instructions"
  mkdir -p "${target}"
  for f in "${GLOBAL_INSTRUCTIONS[@]}"; do
    cp "${CONFIG}/.github/instructions/${f}" "${target}/"
  done
}

copy_extra_instruction() {
  local target="$1"
  local file="$2"
  cp "${CONFIG}/.github/instructions/${file}" "${target}/.github/instructions/"
}

sync_repo() {
  local repo="$1"
  shift
  local extras=("$@")
  local target="${ROOT}/${repo}"
  [[ -d "${target}" ]] || return 0

  mkdir -p "${target}/.github/prompts" "${target}/.vscode"
  cp "${CONFIG}/.github/copilot-instructions.md" "${target}/.github/"
  copy_global_instructions "${target}"
  for f in "${extras[@]}"; do
    copy_extra_instruction "${target}" "${f}"
  done
  cp -R "${CONFIG}/.github/prompts/." "${target}/.github/prompts/"
  cp "${CONFIG}/.github/mcp/mcp.template.json" "${target}/.vscode/mcp.json"
  if [[ -d "${CONFIG}/.github/agents" ]]; then
    mkdir -p "${target}/.github/agents"
    cp -R "${CONFIG}/.github/agents/." "${target}/.github/agents/"
  fi
  if [[ -d "${CONFIG}/.cursor/skills" ]]; then
    mkdir -p "${target}/.cursor/skills"
    cp -R "${CONFIG}/.cursor/skills/." "${target}/.cursor/skills/"
  fi
  echo "Synced → ${repo}"
}

sync_repo customer-portal-frontend react-frontend.instructions.md
sync_repo customer-portal-backend dotnet-api.instructions.md
sync_repo customer-portal-infrastructure terraform-azure.instructions.md
sync_repo customer-portal-deployment customer-portal-devops.instructions.md

WIKI="${ROOT}/customer-portal-wiki"
if [[ -d "${WIKI}" ]]; then
  mkdir -p "${WIKI}/.github/instructions" "${WIKI}/.github/prompts"
  cp "${CONFIG}/.github/copilot-instructions.md" "${WIKI}/.github/"
  copy_global_instructions "${WIKI}"
  copy_extra_instruction "${WIKI}" azure-devops-wiki.instructions.md
  cp -R "${CONFIG}/.github/prompts/." "${WIKI}/.github/prompts/"
  echo "Synced → customer-portal-wiki"
fi

echo "Done. Replace <ADO-ORG> in each .vscode/mcp.json"
