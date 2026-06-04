# AI Tooling Config (shared repository)

Central place for **GitHub Copilot** and **Cursor** settings used across Customer Portal repos. In production this is its own Git repository; consumers copy or symlink files into each app repo.

## Contents

| Path | Purpose |
|------|---------|
| `.github/copilot-instructions.md` | Repo-wide Copilot behavior |
| `.github/instructions/global-mcp.instructions.md` | MCP whitelist and read-only rules |
| `.github/mcp/` | Reference MCP server JSON for VS Code / Cursor |
| `.github/prompts/` | Reusable slash prompts (Azure, ADO, Terraform, .NET) |
| `.cursor/skills/` | Cursor Agent Skills for the same domains |

## Distribute to component repos

**Option A — Copy on release** (simplest for webinar):

```bash
# From workspace root
for repo in customer-portal-frontend customer-portal-backend customer-portal-infrastructure customer-portal-deployment; do
  mkdir -p "$repo/.github/instructions" "$repo/.github/mcp" "$repo/.vscode"
  cp ai-tooling-config/.github/copilot-instructions.md "$repo/.github/"
  cp ai-tooling-config/.github/instructions/global-mcp.instructions.md "$repo/.github/instructions/"
  cp ai-tooling-config/.github/mcp/mcp.template.json "$repo/.vscode/mcp.json"
  # Replace <ADO-ORG> in mcp.json
done
```

**Option B — Git submodule** pointing at this repo’s `ai-tooling-config` path.

**Option C — Pipeline step** in `Developer_Guidelines` that vendors a tagged version of this repo into builds (not shown here).

## MCP setup

1. Copy [`mcp.template.json`](./.github/mcp/mcp.template.json) to `.vscode/mcp.json` in each repo.
2. Replace `<ADO-ORG>` with your Azure DevOps organization name.
3. Ensure Azure MCP includes `--read-only` in `args`.

## Cursor skills

Skills under `.cursor/skills/` are **project skills**. Teams using only Copilot can ignore this folder; teams using Cursor should copy `.cursor/skills` to each repo or rely on user-level skills.
