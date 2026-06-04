#!/usr/bin/env bash
# Copy shared AI config into component repos (run from workspace root)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
CONFIG="${ROOT}/ai-tooling-config"
REPOS=(
  customer-portal-frontend
  customer-portal-backend
  customer-portal-infrastructure
  customer-portal-deployment
)

for repo in "${REPOS[@]}"; do
  target="${ROOT}/${repo}"
  [[ -d "${target}" ]] || continue
  mkdir -p "${target}/.github/instructions" "${target}/.vscode"
  cp "${CONFIG}/.github/copilot-instructions.md" "${target}/.github/"
  cp "${CONFIG}/.github/instructions/global-mcp.instructions.md" "${target}/.github/instructions/"
  cp "${CONFIG}/.github/mcp/mcp.template.json" "${target}/.vscode/mcp.json"
  echo "Synced → ${repo}"
done

echo "Done. Replace <ADO-ORG> in each .vscode/mcp.json"
