# Materials for AI Now Polska #2

The source code you see below has been prepared as part of the [AI Now Polska](https://www.ainowpolska.pl/) #2 webinar - utilizing AI for day-to-day work as Azure Cloud DevOps. In case I'll have a YouTube video of this talk, I'll share it here later on (presentation will be in Polish language).

# Azure DevOps + AI Tooling — Webinar Demo Repository

A **simplified, anonymized** sample workspace for demonstrating everyday productivity with AI assistants in an **Azure-oriented DevOps** context. This is not a production application — it shows **how to structure repos, workspace, Copilot config, MCP, skills, and agent CLI** so viewers can adopt the same patterns.

## What this repo demonstrates

| Topic | Where to look |
|--------|----------------|
| Workspace-level agent rules | [`AGENTS.md`](./AGENTS.md) |
| Multi-repo VS Code workspace | [`azure-devops-ai-workspace.code-workspace`](./azure-devops-ai-workspace.code-workspace) |
| Shared GitHub Copilot / Cursor config | [`ai-tooling-config/`](./ai-tooling-config/) |
| Azure DevOps Wiki as a git repo | [`customer-portal-wiki/`](./customer-portal-wiki/) |
| MCP (Azure + Azure DevOps, read-only) | [`ai-tooling-config/.github/mcp/`](./ai-tooling-config/.github/mcp/) |
| Skills & prompt templates | [`ai-tooling-config/.cursor/skills/`](./ai-tooling-config/.cursor/skills/), [`ai-tooling-config/.github/prompts/`](./ai-tooling-config/.github/prompts/) |
| Agent CLI on pipelines / agents | [`templates/agent-cli/`](./templates/agent-cli/) |
| Copy-paste starters | [`templates/`](./templates/) |

## Layout (multi-repo in one clone)

In production, each folder below is typically its **own Azure DevOps Git repository**. For the webinar, they live in one GitHub repo so attendees can clone once and open the workspace file.

```
repo/
├── AGENTS.md
├── azure-devops-ai-workspace.code-workspace
├── ai-tooling-config/              # Shared AI policy, MCP, prompts, skills
├── customer-portal-wiki/           # Wiki git clone (documentation on the go)
├── customer-portal-frontend/       # Stub app repo
├── customer-portal-backend/        # Stub .NET API repo
├── customer-portal-infrastructure/ # Stub Terraform repo
├── customer-portal-deployment/     # Stub manifest deploy repo
├── templates/                      # Blank templates for your org
└── docs/                           # Setup & demo scenarios
```

## Quick start

1. **Clone** this repository.
2. **Open** `azure-devops-ai-workspace.code-workspace` in Visual Studio Code (or Cursor).
3. **Copy** `ai-tooling-config/.github/mcp/mcp.template.json` → each app repo’s `.vscode/mcp.json` (replace `<ADO-ORG>`).
4. **Sign in** to Azure (`az login`) and Azure DevOps MCP (browser auth on first use).
5. **Read** [`docs/getting-started.md`](./docs/getting-started.md) and [`AGENTS.md`](./AGENTS.md).

## Placeholders to replace

| Placeholder | Example | Used in |
|-------------|---------|---------|
| `<ADO-ORG>` | `contoso` | MCP, AGENTS.md |
| `<ADO-PROJECT>` | `Customer Experience` | AGENTS.md, prompts |
| `<AZURE-SUBSCRIPTION-ID>` | GUID | Terraform vars, Azure MCP |
| `<ACR-NAME>` | `acr0portal0dev0weu001` | Pipeline stubs |

## Splitting into real multi-repo (optional)

After the webinar, you can push each `customer-portal-*` and `ai-tooling-config` folder to separate ADO/GitHub repos and keep the same workspace file with **folder paths** pointing to sibling clones (see [`templates/workspace/code-workspace.template`](./templates/workspace/code-workspace.template)).

## License

MIT — demo and education only.
