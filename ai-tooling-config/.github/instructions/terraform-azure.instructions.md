---
applyTo: "**/*.tf,**/*.tfvars,**/*.tflint.hcl"
description: "Terraform on Azure for Customer Portal infrastructure"
---

# Terraform on Azure (Customer Portal)

Adapted from [awesome-copilot](https://github.com/github/awesome-copilot) `terraform-azure.instructions.md`, scoped to this demo.

## Layout

- Root: `customer-portal-infrastructure/terraform/`
- Environments: `environments/{dev,test,acceptance,production}.tfvars`
- Pipeline: `azure-pipelines.yml` — plan/apply with environment approvals

## Rules

- Run `terraform fmt -recursive` and `terraform validate` before suggesting apply.
- **Never** run `terraform apply` or propose auto-apply from an agent.
- No secrets in `.tf`, `.tfvars`, or state; use Key Vault references and managed identities.
- Pin module sources and provider versions; prefer shared modules from `Platform/terraform-modules` (external).
- Consistent `local.tags` and `var.environment`; follow [Azure naming conventions](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming).
- Remote backend with state locking; never commit `*.tfstate`.
- Subscription ID from `ARM_SUBSCRIPTION_ID` — not hardcoded in provider blocks.

## Anti-patterns

- Hardcoded secrets or connection strings
- `terraform import` as routine workflow
- `local-exec` unless unavoidable
- Branch-per-environment or repo-per-environment layouts (use tfvars instead)
- Disabling security features for convenience

## Modules

Prefer existing patterns in this repo. For net-new Azure resources, consider [Azure Verified Modules](https://azure.github.io/Azure-Verified-Modules/) when no internal module exists — document the choice.

## MCP

Use Azure MCP **read-only** to verify SKUs or naming; do not create or mutate resources via MCP.

## Validation output

When reviewing, suggest: fmt/validate commands, risk summary (add/change/destroy if plan text provided), and rollback (revert commit + targeted plan).
