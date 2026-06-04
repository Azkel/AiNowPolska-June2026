Review the selected Terraform for Azure:

1. **State & backend** — remote state, locking (if visible)
2. **Naming & tags** — consistent `local.tags`, environment suffix
3. **Security** — private endpoints, `restrict_network_access`, Key Vault references
4. **Modules** — pinned sources, clear inputs/outputs
5. **Drift risk** — `lifecycle`, `prevent_destroy` on critical resources

Suggest `terraform fmt` and `terraform validate` commands. If MCP Azure is available, cross-check resource naming patterns only (read-only).

Do not propose `terraform apply`. Flag any secret or connection string in plain text.
