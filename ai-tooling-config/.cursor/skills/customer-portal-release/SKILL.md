---
name: customer-portal-release
description: >-
  Work on Acc/Prod release flow: manifest assembly and deploy pipelines in
  customer-portal-deployment. Use for manifest JSON and deployment YAML.
---

# Customer Portal Release (Acc/Prod)

## Repo

`customer-portal-deployment/`

| File | Role |
|------|------|
| `Assemble-Release-Manifest.yml` | Collect component versions into manifest artifact |
| `Deploy-From-Manifest.yml` | Deploy Acceptance/Production with approvals |
| `release-manifest.example.json` | Manifest shape reference |

## Flow

1. Components on `main` / `hotfix/*` build and push images only
2. Deployment repo assembles manifest (manual or scheduled)
3. Deploy from manifest with environment gates

## Branching authority

`customer-portal-wiki/CustomerPortal/Operations/Branching-and-Deployments.md`

## Investigation

ADO MCP (read-only): pipeline definitions and recent runs for assemble/deploy.

## Safety

- Propose YAML/JSON diffs only; no pipeline queue via MCP
- Manifest must pin versions — no floating `latest` for production paths

## Prompts

`release-manifest-review` for structured reviews.
