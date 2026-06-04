Review the selected Azure DevOps pipeline YAML for:

1. **Triggers** — branch filters, PR vs CI, path filters
2. **Security** — no secrets in YAML; Key Vault / variable groups / service connections
3. **Stages** — build → test → deploy order; environment approvals on prod paths
4. **Reusability** — template references (`@templates`), parameterization
5. **Supply chain** — SBOM, dependency scan hooks if present

Use MCP read tools if available: `pipelines_get_build_definitions`, recent `pipelines_get_builds` for this definition.

Output: table of findings (severity, line, suggestion). Do not edit files until the user approves.
