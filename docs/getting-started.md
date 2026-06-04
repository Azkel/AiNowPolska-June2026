# Getting started (webinar attendees)

## Prerequisites

- Visual Studio Code or Cursor (recent version)
- Git
- Node.js 20+ (for MCP via `npx`)
- Optional: Azure CLI (`az`), .NET 8 SDK, Terraform 1.5+

## 1. Open the workspace

```bash
git clone <your-github-url>
cd <repo-folder>
code azure-devops-ai-workspace.code-workspace
```

## 2. Configure MCP

1. Copy `ai-tooling-config/.github/mcp/mcp.template.json` to `.vscode/mcp.json` in each repo you use, **or** once at workspace root if your IDE supports it.
2. Replace `<ADO-ORG>` with your Azure DevOps organization (demo uses `contoso`).
3. Sign in when prompted (Azure DevOps MCP uses browser auth on first run).
4. Run `az login` for Azure MCP resource queries.

## 3. Enable Copilot instructions

VS Code / Copilot should pick up paths from the workspace file. Per-repo alternative:

- Copy `ai-tooling-config/.github/copilot-instructions.md` → `<repo>/.github/copilot-instructions.md`
- Copy `ai-tooling-config/.github/instructions/global-mcp.instructions.md` → `<repo>/.github/instructions/`

## 4. Cursor skills (optional)

Copy `ai-tooling-config/.cursor/skills/` to `.cursor/skills/` in a repo, or add the `ai-tooling-config` folder to your Cursor skills path.

## 5. Wiki workflow

1. Open `customer-portal-wiki/` in the workspace.
2. Edit markdown (e.g. add a runbook section).
3. Use prompt `wiki-runbook-update.prompt.md` to draft content.
4. In real ADO: commit and push to the wiki git remote (`wikiMain`).

## 6. Agent CLI on a build agent

See [`templates/agent-cli/README.md`](../templates/agent-cli/README.md) for `copilot-agent` (or equivalent) running headless on Azure DevOps self-hosted or Microsoft-hosted agents with approval gates.

## 7. Read AGENTS.md

[`AGENTS.md`](../AGENTS.md) is the contract for AI assistants in this workspace — customize placeholders before production use.
