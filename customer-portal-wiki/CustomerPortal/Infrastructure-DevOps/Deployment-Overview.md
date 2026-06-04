# Deployment overview

Operator hub for Customer Portal environments.

## Environments

| Name | Purpose | IaC tfvars |
|------|---------|------------|
| Dev | Developer integration | `dev.tfvars` |
| Test | QA / automated tests | `test.tfvars` |
| Acceptance | Pre-production | `acceptance.tfvars` |
| Production | Live | `production.tfvars` |

## Prerequisites

- Azure DevOps service connections (Azure RM, ACR)
- Variable groups per environment (no secrets in git)
- Approvals on Test (optional), Acceptance, Production

## Update this wiki from the IDE

1. Clone the wiki repo (this folder in the demo monorepo).
2. Edit markdown locally.
3. Commit and push to `wikiMain` (or your wiki default branch).
4. AI assistants can draft pages — human reviews before push.
