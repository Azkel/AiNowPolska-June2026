---
name: devops-change-plan
description: >-
  Draft a cross-repo DevOps change plan under docs/change-*.md before editing
  pipelines, Terraform, or deployment manifests. Use for IaC, CI/CD, or wiki ops changes.
---

# DevOps Change Plan

Adapted from awesome-copilot `structured-autonomy-plan` for this workspace's **plan-first** rule (`AGENTS.md`).

## When to use

Non-trivial changes touching:

- `customer-portal-infrastructure` Terraform
- Any `DevOps/CI.yml` or `azure-pipelines.yml`
- `customer-portal-deployment` manifest or deploy pipelines
- Cross-repo tags, variables, or environment config

## Workflow

1. **Research** — read affected files, wiki branching doc, existing tfvars/pipelines
2. **Scope** — list repos, files, dependencies, risks
3. **Write plan** — create `docs/change-YYYY-MM-DD-short-title.md` at workspace root with:
   - Goal and out of scope
   - Change map (order, repo, files, validation)
   - Rollback per repo
   - Wiki page to update
4. **Pause** — present plan; wait for explicit approval before edits

## Output template

```markdown
# Change: {title}

**Date:** YYYY-MM-DD
**Repos:** {list}

## Goal
{1-2 sentences}

## Change map
| Order | Repo | Files | Validation |
|-------|------|-------|------------|

## Rollback
{per repo}

## Wiki
{path + section}
```

## Do not

- Write implementation code in the planning step
- Skip the plan for pipeline or Terraform changes that affect multiple repos

Prompt shortcut: `cross-repo-change-map`.
