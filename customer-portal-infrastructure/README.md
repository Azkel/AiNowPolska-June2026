# Customer Portal — Infrastructure (Terraform)

Simplified Azure IaC for webinar demos. Not deployable to a real subscription without filling in backend and subscription IDs.

## Layout

```
terraform/
  main.tf
  variables.tf
  environments/
    dev.tfvars
    test.tfvars
```

## Local validation

```bash
cd terraform
terraform init -backend=false
terraform fmt -check -recursive
terraform validate
```

## AI assistance

- Skill: `ai-tooling-config/.cursor/skills/terraform-iac`
- Prompt: `terraform-plan-review.prompt.md`
- MCP: Azure read-only for resource checks
