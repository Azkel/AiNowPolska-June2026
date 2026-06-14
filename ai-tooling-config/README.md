# AI Tooling Config (shared repository)

Central place for **GitHub Copilot** and **Cursor** settings used across Customer Portal repos. In production this is its own Git repository; consumers copy or symlink files into each app repo.

This package is tuned for the **Azure DevOps AI demo** (multi-repo workspace, MCP read-only investigation, IaC/pipeline/wiki focus) — not generic Copilot defaults.

## Contents

| Path | Purpose |
|------|---------|
| `.github/copilot-instructions.md` | Repo-wide Copilot behavior + demo prompt index |
| `.github/instructions/` | Path-specific rules (Terraform, .NET, React, wiki, DevOps context) |
| `.github/instructions/global-mcp.instructions.md` | MCP whitelist and read-only rules |
| `.github/mcp/` | Reference MCP server JSON for VS Code / Cursor |
| `.github/prompts/` | Reusable slash prompts (ADO, Terraform, .NET, React, release) |
| `.github/agents/` | Optional Copilot custom agents (pipeline triage, Terraform review) |
| `.cursor/skills/` | Cursor Agent Skills for the same domains |

## Prompts

| Prompt | Domain |
|--------|--------|
| `investigate-failed-build` | ADO MCP build triage (demo Scenario A) |
| `cross-repo-change-map` | Multi-repo change planning (Scenario E) |
| `wiki-runbook-update` | ADO Wiki runbooks |
| `terraform-plan-review` | Terraform on Azure |
| `dotnet-api-review` | .NET 8 API |
| `react-frontend-review` | React + TypeScript + CI |
| `release-manifest-review` | Acc/Prod manifest and deploy |
| `azure-pipeline-review` | Component CI YAML |
| `ado-work-item-draft` | Backlog markdown (no MCP create) |

## Cursor skills

| Skill | When to use |
|-------|-------------|
| `azure-devops-mcp` | WIQL, builds, wiki, PR search via MCP |
| `azure-pipeline` | YAML pipelines and template extends |
| `terraform-iac` | Terraform fmt/validate workflow |
| `dotnet-api` | Backend API and CI conventions |
| `react-frontend` | Frontend stub, env, CI |
| `customer-portal-release` | Manifest assemble + Acc/Prod deploy |
| `devops-change-plan` | `docs/change-*.md` before pipeline/IaC edits |

## Copilot agents

| Agent | When to use |
|-------|-------------|
| `ado-pipeline-investigator` | Read-only failed build analysis |
| `terraform-plan-reviewer` | IaC review with plan discipline |

## Distribute to component repos

**Option A — Sync script** (recommended for demo):

```bash
# From workspace root
./ai-tooling-config/scripts/sync-config-to-repos.sh
# Replace <ADO-ORG> in each repo's .vscode/mcp.json
```

**Option B — Manual copy** per [`templates/copilot/README.md`](../templates/copilot/README.md).

**Option C — Git submodule** pointing at this repo.

## MCP setup

1. Copy [`mcp.template.json`](./.github/mcp/mcp.template.json) to `.vscode/mcp.json` in each repo.
2. Replace `<ADO-ORG>` with your Azure DevOps organization name.
3. Ensure Azure MCP includes `--read-only` in `args`.

## Provenance (awesome-copilot)

Curated and adapted from [github/awesome-copilot](https://github.com/github/awesome-copilot). We **kept or trimmed** items aligned with Azure DevOps, Terraform on Azure, .NET, React, and DevOps planning — we did **not** vendor unrelated stacks (Salesforce, Power Platform, etc.).

| This repo | awesome-copilot source | Notes |
|-----------|------------------------|--------|
| `instructions/terraform-azure.instructions.md` | `terraform-azure.instructions.md` | Scoped to `customer-portal-infrastructure` |
| `instructions/customer-portal-devops.instructions.md` | `devops-core-principles.instructions.md` | Condensed CALMS/DORA for demo |
| `instructions/azure-devops-wiki.instructions.md` | wiki/Markdown patterns | ADO Mermaid + runbook structure |
| `agents/ado-pipeline-investigator.agent.md` | `se-gitops-ci-specialist.agent.md` | ADO MCP read-only triage |
| `agents/terraform-plan-reviewer.agent.md` | `terraform-iac-reviewer.agent.md` | No auto-apply |
| `skills/devops-change-plan` | `structured-autonomy-plan` | Maps to `docs/change-*.md` |

**Considered but not copied** (wrong scope or too heavy for demo): full `dotnet-architecture-good-practices` (DDD ceremony), AVM repo instructions, `azure-devops-cli` skill (MCP-first policy), React 19 migration pack, generic `taming-copilot` (merged into copilot-instructions).

Attendees can browse awesome-copilot for additional community prompts and plugins.

## Cursor skills location

Skills under `.cursor/skills/` are **project skills**. Teams using only Copilot can ignore this folder; teams using Cursor should copy `.cursor/skills` to each repo or rely on user-level skills.
