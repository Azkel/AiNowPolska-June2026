---
name: dotnet-api
description: >-
  Work on the Customer Portal .NET API. Use for Program.cs, endpoints, EF Core,
  and API pipeline YAML in customer-portal-backend.
---

# .NET API (Customer Portal backend)

## Project

- `customer-portal-backend/src/Portal.Api/` — ASP.NET Core minimal API stub
- CI: `DevOps/CI.yml`

## Standards

- .NET 8, `ILogger<T>`, options pattern for configuration
- Entra ID for auth; Problem Details for errors
- xUnit tests under `tests/` when added

## Pipelines

- `develop` → build, push image, deploy Dev then Test
- `main` / `hotfix/*` → build and push only; Acc/Prod via deployment repo manifest

## Do not

- Commit `appsettings.Development.json` with real secrets
- Change `DevOps/CI.yml` without noting human review in the summary
