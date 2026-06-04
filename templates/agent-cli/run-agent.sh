#!/usr/bin/env bash
# Demo wrapper for headless Copilot CLI on ADO agents
set -euo pipefail

PROMPT_FILE="${1:-}"
OUTPUT_DIR="${2:-$(Build.ArtifactStagingDirectory)/agent-output}"
TIMEOUT_SEC="${AGENT_TIMEOUT_SEC:-600}"

if [[ -z "${PROMPT_FILE}" || ! -f "${PROMPT_FILE}" ]]; then
  echo "Usage: run-agent.sh <prompt-file.md> [output-dir]" >&2
  exit 1
fi

mkdir -p "${OUTPUT_DIR}"

if [[ -z "${GITHUB_TOKEN:-}" && -z "${GH_TOKEN:-}" ]]; then
  echo "GITHUB_TOKEN or GH_TOKEN must be set" >&2
  exit 1
fi

# Adjust flags to match your org's Copilot CLI version (see official docs)
timeout "${TIMEOUT_SEC}" npx -y @github/copilot \
  --allow-all-tools=false \
  --prompt "$(cat "${PROMPT_FILE}")" \
  > "${OUTPUT_DIR}/agent-response.md" 2> "${OUTPUT_DIR}/agent.log" || {
    echo "Agent exited non-zero; see agent.log" >&2
    exit 2
  }

# Redact common secret patterns from logs before publish (basic demo)
sed -i.bak -E 's/(ghp_|gho_)[A-Za-z0-9_]+/[REDACTED]/g' "${OUTPUT_DIR}/agent.log" 2>/dev/null || true

echo "Wrote ${OUTPUT_DIR}/agent-response.md"
