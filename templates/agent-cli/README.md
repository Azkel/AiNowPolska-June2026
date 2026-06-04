# Agent CLI on Azure DevOps agents

Run **GitHub Copilot CLI** (`@github/copilot`) or compatible **agent** modes headlessly on Microsoft-hosted or self-hosted pipeline agents. Use for drafts and analysis — **not** for autonomous production deploys.

## Prerequisites

| Item | Notes |
|------|--------|
| GitHub Copilot subscription | Business/Enterprise with CLI enabled by admin |
| `GITHUB_TOKEN` or `GH_TOKEN` | PAT or OIDC with Copilot access — store in ADO secret variable group |
| Node.js 20+ | On the agent image |
| Optional: Azure DevOps MCP | Configure via env for ADO-aware prompts (read-only in demos) |

## Install on agent (Linux)

```bash
npm install -g @github/copilot
# or one-shot:
npx -y @github/copilot --version
```

Authenticate in CI via `GITHUB_TOKEN` (documented in [Copilot CLI](https://github.com/features/copilot/cli)).

## Files in this folder

| File | Purpose |
|------|---------|
| `azure-pipelines-copilot-agent.yml` | Pipeline snippet: install CLI, run prompt file, publish markdown artifact |
| `prompts/pipeline-failure-summary.md` | Example prompt fed to the agent |
| `prompts/wiki-changelog-draft.md` | Draft release notes / wiki section from manifest |
| `run-agent.sh` | Wrapper: non-interactive run with timeout and log redaction |

## Governance

- Run on **PR** or **scheduled** pipelines, not on every commit to `main` without review.
- Publish output as **build artifact** or PR comment — human merges wiki/YAML.
- Keep MCP and CLI on **read-only** ADO/Azure operations in production policies.
- Do not pass `System.AccessToken` to untrusted third-party tasks without scoping.

## Alternatives shown in the webinar

- Marketplace tasks (e.g. Copilot code review extensions for Azure DevOps)
- Custom webhook → pipeline (work item assigned → plan agent)
- Cursor / SDK agents in cloud for longer-running tasks
