---
name: azure-pipeline
description: >-
  Author and review Azure DevOps YAML pipelines. Use for CI/CD, template
  extends, environment gates, and manifest-based releases.
---

# Azure Pipelines

## Repos

| Repo | Pipeline role |
|------|----------------|
| `customer-portal-frontend`, `customer-portal-backend` | Component CI/CD (Dev/Test on develop) |
| `customer-portal-infrastructure` | Terraform plan/apply per environment |
| `customer-portal-deployment` | Assemble manifest, deploy Acc/Prod |

## Templates

Reference shared templates: `Developer_Guidelines/pipeline-templates` as `@templates` (replace with your org path).

## SemVer PR titles (when using shared build templates)

Prefix: `[feature]`, `[fix]`, `[breaking]`, or `[noSemVer]` at start of PR title.

## Investigation

Use ADO MCP: `pipelines_get_build_definitions`, `pipelines_get_builds`, `pipelines_get_build_log`.

## Safety

Propose YAML diffs only; do not queue runs via MCP unless explicitly approved.
