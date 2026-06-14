# Prompt templates (GitHub Copilot)

Files use the `.prompt.md` convention for Copilot Chat slash prompts. Source of truth: `ai-tooling-config/.github/prompts/`.

| Prompt | Domain |
|--------|--------|
| `investigate-failed-build.prompt.md` | ADO MCP build triage (demo Scenario A) |
| `cross-repo-change-map.prompt.md` | Multi-repo planning (Scenario E) |
| `wiki-runbook-update.prompt.md` | ADO Wiki git |
| `terraform-plan-review.prompt.md` | Terraform on Azure |
| `dotnet-api-review.prompt.md` | .NET 8 APIs |
| `react-frontend-review.prompt.md` | React + TypeScript + CI |
| `release-manifest-review.prompt.md` | Acc/Prod manifest |
| `azure-pipeline-review.prompt.md` | Azure DevOps YAML |
| `ado-work-item-draft.prompt.md` | Backlog items |

Install: run `ai-tooling-config/scripts/sync-config-to-repos.sh` or copy to `.github/prompts/` and reload VS Code. Invoke via Copilot prompt picker.

Several prompts are adapted from patterns in [awesome-copilot](https://github.com/github/awesome-copilot); see `ai-tooling-config/README.md#provenance-awesome-copilot`.
