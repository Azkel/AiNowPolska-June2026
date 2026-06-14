Review release manifest and deployment pipelines in `customer-portal-deployment`:

1. **Manifest** — `release-manifest.example.json` shape; pinned image tags/digests; component versions aligned across frontend/backend/infra
2. **Assemble** — `Assemble-Release-Manifest.yml`: inputs, artifact output, manual vs scheduled
3. **Deploy** — `Deploy-From-Manifest.yml`: environment gates (`Acceptance`, `Production`), approvals, service connections
4. **Branching** — Acc/Prod only from manifest; no direct component CI deploy to prod paths
5. **Rollback** — previous manifest reference or redeploy procedure

Use ADO MCP read-only if available: recent pipeline runs for assemble/deploy definitions.

Output: findings table + recommended wiki section for operators. Do not queue pipeline runs or edit YAML until approved.

Reference: `customer-portal-wiki/CustomerPortal/Operations/Branching-and-Deployments.md`.
