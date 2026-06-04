# Branching and deployments (Customer Portal)

Entry point for how the portal ships code. **Demo content** — align with your org’s real policies.

## Current model

| Branch | Role |
|--------|------|
| `develop` | Integration; PRs squash-merge; CI deploys **Dev → Test** |
| `main` | Release line; no Dev/Test deploy from component CI |
| `hotfix/*` | Fix from `main`; Acc/Prod via deployment manifest |

## Acc / Prod

Use `customer-portal-deployment`:

1. **Assemble-Release-Manifest** — pick component versions (SemVer image tags).
2. **Deploy-From-Manifest** — manual run with environment approval.

## Flow (diagram)

::: mermaid
flowchart LR
  feature[feature branch] --> develop
  develop -->|release PR| main
  main --> manifest[Assemble manifest]
  manifest --> acc[Acceptance]
  acc --> prod[Production]
:::

## Related pages

- [Deployment overview](../Infrastructure-DevOps/Deployment-Overview.md)
- [Pipeline badges](../Infrastructure-DevOps/Pipelines.md)
