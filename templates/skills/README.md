# Cursor skills templates

Copy skill folders from `ai-tooling-config/.cursor/skills/` into each repo’s `.cursor/skills/` (or run `ai-tooling-config/scripts/sync-config-to-repos.sh`):

| Skill | When to use |
|-------|-------------|
| `azure-devops-mcp` | WIQL, builds, wiki, PR search via MCP |
| `azure-pipeline` | YAML pipelines and manifest releases |
| `terraform-iac` | Terraform fmt/validate workflow |
| `dotnet-api` | Backend API and CI conventions |
| `react-frontend` | Frontend env, API contract, CI |
| `customer-portal-release` | Manifest assemble + Acc/Prod deploy |
| `devops-change-plan` | Plan in `docs/change-*.md` before IaC/pipeline edits |

Each skill is a directory with `SKILL.md` (YAML frontmatter + instructions). See [Cursor skills documentation](https://docs.cursor.com/context/skills).

`devops-change-plan` adapts awesome-copilot `structured-autonomy-plan` for this workspace.
