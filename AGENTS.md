# AGENTS.md — Workspace: Customer Portal (Demo)

This workspace demonstrates a **multi-repository** Azure DevOps setup with AI assistance focused on **DevOps productivity**: CI/CD, IaC, environments, release flow, and operational documentation — not on application feature development.

---

## 1) Workspace structure

### Application repositories (stubs)

| Folder | Role |
|--------|------|
| `customer-portal-frontend/` | Web UI (connects to API) |
| `customer-portal-backend/` | .NET API |
| `customer-portal-deployment/` | Shared deployment: manifest assemble + Acc/Prod deploy |
| `customer-portal-infrastructure/` | Terraform for Azure (simplified) |

### Documentation repository

| Folder | Role |
|--------|------|
| `customer-portal-wiki/` | Azure DevOps Wiki cloned as Git — update runbooks and ops docs in the IDE |

### Shared AI configuration

| Folder | Role |
|--------|------|
| `ai-tooling-config/` | Organization-wide Copilot instructions, MCP reference configs, reusable prompts and Cursor skills |

In production, clone each folder from a **separate** remote and open [`azure-devops-ai-workspace.code-workspace`](./azure-devops-ai-workspace.code-workspace).

---

## 2) Environments

Managed via `customer-portal-infrastructure/terraform/environments/`:

| Environment | Tfvars file | Typical ADO environment name |
|-------------|-------------|------------------------------|
| Dev | `dev.tfvars` | `Dev` |
| Test | `test.tfvars` | `Test` |
| Acceptance | `acceptance.tfvars` | `Acceptance` |
| Production | `production.tfvars` | `Production` |

Short names in pipelines: `dev`, `tst`, `acc`, `prod`.

---

## 3) Branching and deployment (summary)

Authoritative detail: `customer-portal-wiki/CustomerPortal/Operations/Branching-and-Deployments.md`.

| Branch | Role |
|--------|------|
| `develop` | Integration; feature PRs squash-merge here; CI deploys **Dev → Test** |
| `main` | Release line; **no** Dev/Test deploy from component CI |
| `hotfix/*` | Emergency fix from `main`; Acc/Prod via manifest |

**Acc/Prod:** `customer-portal-deployment` — assemble release manifest, then deploy from manifest (manual, approvals).

---

## 4) How agents should work here

### 4.1 Plan in `docs/` first (workspace root)

For non-trivial changes, add a short plan under workspace `docs/` (e.g. `docs/change-YYYY-MM-DD-short-title.md`) before editing pipelines or Terraform.

### 4.2 MCP-first for Azure and Azure DevOps (read-only default)

Prefer **MCP tools** over ad-hoc `az` or portal clicks when gathering read-only information.

**Before any MCP call:** read the tool schema (Cursor MCP descriptors or server tool list).

| Need | MCP server | Example read tools |
|------|------------|-------------------|
| Work items, WIQL | Azure DevOps MCP | `wit_get_work_item`, `wit_query_by_wiql`, `search_workitem` |
| Pipelines, logs | Azure DevOps MCP | `pipelines_get_builds`, `pipelines_get_build_log`, `pipelines_get_run` |
| Repos, PRs | Azure DevOps MCP | `repo_get_pull_request_by_id`, `repo_search_commits`, `repo_get_file_content` |
| Wiki | Azure DevOps MCP | `wiki_get_page_content`, `wiki_list_pages`, `search_wiki` |
| Azure resources | Azure MCP (`@azure/mcp` with `--read-only`) | List/get resources, diagnostics |

**Azure DevOps context (replace for your org):**

- Organization: `<ADO-ORG>` (example: `contoso`)
- Project: `<ADO-PROJECT>` (example: `Customer Experience`)

**Writes:** Do not create/update/delete ADO or Azure resources via MCP unless the human explicitly requests it and policy allows. Draft changes for manual application.

### 4.3 Wiki — Mermaid syntax

In `customer-portal-wiki/`, use Azure DevOps wiki fences:

```
::: mermaid
flowchart LR
  develop --> main
:::
```

Not GitHub-style ` ```mermaid ` fences.

### 4.4 Safety

- Small, reviewable changes; no secrets in code.
- Cross-repo changes: include a short change map (repos, order, rollback).
- Update wiki when operations or environments change.

---

## 5) MCP servers

Reference configs: `ai-tooling-config/.github/mcp/`.

| Server | Config | Policy |
|--------|--------|--------|
| Azure MCP | `azure-mcp.readonly.json` | Must use `--read-only` |
| Azure DevOps MCP | `azure-devops-mcp.json` | Read-only enforced via `global-mcp.instructions.md` |

Combined template for `.vscode/mcp.json`: `mcp.template.json`.

Instructions: `ai-tooling-config/.github/instructions/global-mcp.instructions.md`.

---

## 6) Skills and prompts

| Type | Location |
|------|----------|
| Cursor skills (project) | `ai-tooling-config/.cursor/skills/` |
| GitHub Copilot prompt files | `ai-tooling-config/.github/prompts/` |
| Copilot repo instructions | `ai-tooling-config/.github/copilot-instructions.md` |

Copy or symlink shared config into each component repo (see `ai-tooling-config/README.md`).

---

## 7) Agent CLI (pipelines / self-hosted agents)

Templates for non-interactive agents on Azure DevOps agents: `templates/agent-cli/`.

Use for: scheduled doc checks, draft release notes, terraform plan summaries, PR description helpers — always with human review gates.

---

## 8) Output expectations

When delivering changes:

- Summary and why
- Validation steps (`terraform fmt`, `terraform validate`, pipeline YAML sanity)
- Rollback notes
- Paths touched

Keep committed docs free of internal ticket numbers unless the user asks; link work items in PR descriptions instead.

---

## 9) External repos (out of workspace)

Typical real-world siblings (not included in this demo clone):

| Purpose | ADO path pattern |
|---------|------------------|
| Pipeline templates | `Developer_Guidelines/pipeline-templates` |
| Shared Terraform modules | `Platform/terraform-modules` |

If a change needs those repos: plan here, PR there, pin version back here.
