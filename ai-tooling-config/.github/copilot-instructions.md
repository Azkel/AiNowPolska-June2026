---
applyTo: "**"
---

# Customer Portal — Global Copilot Instructions (Demo)

You assist engineers working on **Azure**, **Azure DevOps**, **.NET**, and **Terraform** in a regulated enterprise context. Prefer clarity and safe defaults over speed.

## Plan first

For non-trivial tasks:

1. Analyze scope and list affected files/repos.
2. Present a short implementation plan (risks, validation, rollback).
3. Wait for explicit approval before writing code or changing pipelines/IaC.

## Prohibitions

- No hardcoded secrets, connection strings, or real PII in examples.
- No autonomous `git commit`, `git push`, `terraform apply`, `az` deploy, or pipeline runs.
- No disabling security scans or quality gates.
- MCP: only whitelisted servers; Azure MCP must be **read-only**; Azure DevOps MCP **read-only** unless written approval (see `global-mcp.instructions.md`).

## Stack (demo)

| Layer | Standard |
|-------|----------|
| Backend | .NET 8, ASP.NET Core |
| Frontend | React + TypeScript |
| Auth | Microsoft Entra ID |
| IaC | Terraform on Azure |
| CI/CD | Azure DevOps YAML |
| Docs | Azure DevOps Wiki (git) |

## MCP

Follow [`instructions/global-mcp.instructions.md`](./instructions/global-mcp.instructions.md). Reference configs: [`mcp/`](./mcp/).

## Quality

- API errors: RFC 7807 Problem Details where applicable.
- Terraform: `fmt` + `validate` before suggesting apply.
- Pipelines: flag any change to `azure-pipelines.yml` for human review.

## Work items

Link changes to Azure DevOps work items in PR descriptions; do not embed ticket numbers in wiki pages unless asked.
