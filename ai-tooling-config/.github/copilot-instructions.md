---
applyTo: "**"
---

# Customer Portal — Copilot Instructions (Azure DevOps AI Demo)

You assist engineers in a **multi-repo Azure DevOps workspace** focused on **DevOps productivity**: CI/CD, Terraform on Azure, release manifests, wiki runbooks, and MCP-based investigation — not greenfield application features.

**Fictional context:** Contoso Customer Portal (`customer-portal-*` repos). Replace `<ADO-ORG>` / `<ADO-PROJECT>` placeholders with the attendee's org.

## Workspace contract

Read root [`AGENTS.md`](../../AGENTS.md) for repo map, environments, branching, and agent rules.

| Topic | Where |
|-------|--------|
| Demo scripts | Workspace `docs/demo-scenarios.md` |
| Path-specific rules | [`.github/instructions/`](./instructions/) (see below) |
| Slash prompts | [`.github/prompts/`](./prompts/) |
| Custom agents | [`.github/agents/`](./agents/) |
| MCP policy | [`instructions/global-mcp.instructions.md`](./instructions/global-mcp.instructions.md) |

## Path-specific instructions

| File | Applies to |
|------|------------|
| `customer-portal-devops.instructions.md` | Whole workspace — DORA, multi-repo, demo scenarios |
| `terraform-azure.instructions.md` | `*.tf`, `*.tfvars` |
| `dotnet-api.instructions.md` | `*.cs`, backend |
| `react-frontend.instructions.md` | `*.tsx`, frontend |
| `azure-devops-wiki.instructions.md` | `customer-portal-wiki/**/*.md` |

## Plan first

For non-trivial pipeline, IaC, manifest, or cross-repo changes:

1. Analyze scope; list repos and files.
2. Draft `docs/change-YYYY-MM-DD-*.md` or use prompt `cross-repo-change-map`.
3. Present risks, validation, rollback.
4. Wait for explicit approval before editing.

## Prohibitions

- No hardcoded secrets, connection strings, or real PII.
- No autonomous `git commit`, `git push`, `terraform apply`, deploy, or pipeline runs.
- No disabling security scans or quality gates.
- MCP: whitelisted servers only; Azure MCP **read-only**; ADO MCP **read-only** (see global MCP instructions).

## Stack (demo)

| Layer | Standard |
|-------|----------|
| Backend | .NET 8, ASP.NET Core minimal API |
| Frontend | React + TypeScript (stub) |
| Auth | Microsoft Entra ID |
| IaC | Terraform on Azure |
| CI/CD | Azure DevOps YAML |
| Acc/Prod | Manifest in `customer-portal-deployment` |
| Docs | Azure DevOps Wiki (git) — ADO Mermaid `::: mermaid` fences |

## Recommended prompts (presentation)

| Prompt | Use when |
|--------|----------|
| `investigate-failed-build` | Live MCP build triage (Scenario A) |
| `wiki-runbook-update` | Runbook / rollback section (Scenario B) |
| `terraform-plan-review` | IaC review (Scenario C) |
| `dotnet-api-review` | API review (Scenario D) |
| `cross-repo-change-map` | Multi-repo planning (Scenario E) |
| `release-manifest-review` | Acc/Prod manifest and deploy YAML |
| `azure-pipeline-review` | Component CI YAML |
| `ado-work-item-draft` | Backlog item markdown (no MCP create) |

## Quality

- API errors: RFC 7807 Problem Details where applicable.
- Terraform: `fmt` + `validate` before suggesting apply.
- Pipelines: flag any YAML change for human review.
- Wiki: ADO Mermaid syntax, validation and rollback sections.

## Attributions

Several instructions and agents are **adapted from** [github/awesome-copilot](https://github.com/github/awesome-copilot) and trimmed for this Customer Portal DevOps showcase. See [`README.md`](./README.md#provenance-awesome-copilot).
