# Customer Portal — Deployment

Central repo for **Acceptance** and **Production** promotion via release manifest (pattern used in multi-repo Azure setups).

## Pipelines (demo names)

| Pipeline | Purpose |
|----------|---------|
| `Assemble-Release-Manifest.yml` | Collect component versions into `release-manifest` artifact |
| `Deploy-From-Manifest.yml` | Manual deploy to Acc or Prod with approvals |

## Components in manifest (example)

- `customer-portal-frontend`
- `customer-portal-backend`

See `release-manifest.example.json`.
