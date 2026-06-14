---
applyTo: "**"
description: "DevOps context for the Customer Portal multi-repo Azure DevOps demo workspace"
---

# Customer Portal DevOps Context

This workspace showcases **AI-assisted DevOps** — not greenfield app features. Optimize for CI/CD, IaC, release flow, runbooks, and safe investigation via MCP.

## What we optimize for (DORA, briefly)

| Metric | In this demo |
|--------|----------------|
| Deployment frequency | `develop` → Dev/Test via component CI; Acc/Prod via manifest |
| Lead time | Small PRs; plan in `docs/change-*.md` before pipeline/IaC edits |
| Change failure rate | Human review on YAML/Terraform; no agent auto-deploy |
| MTTR | MCP read-only build/log triage; wiki runbooks with rollback steps |

## Multi-repo map

| Repo | AI focus |
|------|----------|
| `customer-portal-infrastructure` | Terraform plan review, tfvars, module pins |
| `customer-portal-frontend`, `customer-portal-backend` | Pipeline YAML, build/deploy to Dev/Test |
| `customer-portal-deployment` | Release manifest assemble + Acc/Prod deploy |
| `customer-portal-wiki` | Runbooks, branching docs, ADO Mermaid |
| `ai-tooling-config` | Shared prompts, instructions, MCP, skills |

Authoritative branching: `customer-portal-wiki/CustomerPortal/Operations/Branching-and-Deployments.md`.

## Agent behavior in this workspace

1. **Plan first** — non-trivial changes: scope, repos, validation, rollback; wait for approval.
2. **MCP read-only** — Azure DevOps and Azure MCP for investigation; humans apply fixes.
3. **Cross-repo changes** — output a change map (repos, files, merge order, wiki page).
4. **No autonomous writes** — no commit, push, `terraform apply`, pipeline queue, or work item create via MCP.

## Presentation demo scenarios

See workspace `docs/demo-scenarios.md`: failed build triage, wiki runbook, Terraform review, .NET review, cross-repo change map, agent CLI outline.
