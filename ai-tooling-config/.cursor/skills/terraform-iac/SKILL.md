---
name: terraform-iac
description: >-
  Edit and review Terraform for Azure in this workspace. Use for IaC changes,
  environment tfvars, module wiring, and plan-only validation steps.
---

# Terraform IaC (Azure)

## Layout

- Root: `customer-portal-infrastructure/terraform/`
- Environments: `environments/*.tfvars`
- Pipeline: `azure-pipelines.yml` (plan/apply with approvals)

## Workflow

1. Read existing `main.tf`, `variables.tf`, and target `*.tfvars`.
2. Propose changes; run `terraform fmt -recursive` and `terraform validate` (user or agent terminal).
3. Never run `terraform apply` without explicit human approval.

## Conventions

- Use `azurerm_*` resources with consistent `local.tags` and `var.environment`.
- Secrets via Key Vault references — never plain text in tfvars committed to git.
- Prefer shared modules from `Platform/terraform-modules` (external) with version pins.

## MCP

Use Azure MCP read-only to verify resource names or SKUs when unsure; do not create resources via MCP.
