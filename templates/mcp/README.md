# MCP templates

Canonical copies live in `ai-tooling-config/.github/mcp/`:

- `azure-mcp.readonly.json` — Azure MCP with `--read-only`
- `azure-devops-mcp.json` — ADO org placeholder
- `mcp.template.json` — combined for `.vscode/mcp.json`

## Cursor

Cursor uses the same JSON in `.cursor/mcp.json` or user settings — align server names with your Cursor MCP UI.

## Authentication

- **Azure MCP:** `az login` (user or service principal on agents)
- **Azure DevOps MCP:** browser sign-in on first tool call; PAT alternative per Microsoft docs

## Read-only

Azure: enforce `--read-only` in args.

Azure DevOps: no native flag — enforce via `global-mcp.instructions.md`.
