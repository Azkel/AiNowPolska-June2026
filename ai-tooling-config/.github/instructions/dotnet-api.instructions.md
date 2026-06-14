---
applyTo: "**/*.cs,**/*.csproj,**/Program.cs"
description: "ASP.NET Core API standards for Customer Portal backend"
---

# .NET API (Customer Portal Backend)

Lightweight guidance for the demo API stub — not full DDD ceremony. Inspired by awesome-copilot .NET patterns, trimmed for minimal APIs and DevOps focus.

## Project

- `customer-portal-backend/src/Portal.Api/` — ASP.NET Core 8 minimal API
- CI: `DevOps/CI.yml` — build, container push, Dev/Test on `develop`

## Standards

- **Hosting** — correct middleware order; `ILogger<T>`; options pattern for config
- **Auth** — Microsoft Entra ID / JWT; no custom crypto
- **Errors** — RFC 7807 Problem Details; correlation ID in logs
- **Data** — EF Core with parameterized queries; no secrets in committed `appsettings`
- **Async** — `async`/`await` for I/O; constructor injection for dependencies
- **Tests** — xUnit, `Method_Scenario_Expected`, AAA pattern

## Pipelines

- `develop` → build, push image, deploy Dev then Test
- `main` / `hotfix/*` → build and push only; Acc/Prod via `customer-portal-deployment` manifest

## Review checklist

| Area | ✅ | ⚠️ | ❌ |
|------|----|----|-----|
| Secrets in source | none | — | any plaintext |
| Auth on endpoints | Entra/JWT | partial | missing on protected routes |
| Error shape | Problem Details | inconsistent | raw exceptions to client |

Flag any change to `DevOps/CI.yml` for human review.
