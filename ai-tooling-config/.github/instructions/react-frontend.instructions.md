---
applyTo: "**/*.{tsx,ts,jsx,js},**/package.json,**/vite.config.*"
description: "React + TypeScript frontend for Customer Portal"
---

# React Frontend (Customer Portal)

The frontend repo is a **stub** for pipeline and workspace demos; apply these rules when source is added or reviewed.

## Stack

- React 18+ with TypeScript
- Vite (typical) or existing toolchain in repo
- Entra ID for auth (MSAL React when integrated)
- Calls `customer-portal-backend` API — no secrets in client bundle

## Standards

- Functional components; typed props and API responses
- Environment-specific API URLs via build-time env vars — not hardcoded prod URLs
- Error boundaries and loading states for API calls
- Accessibility: semantic HTML, labels on forms, keyboard navigation
- Tests: Vitest + React Testing Library when present; user-centric queries (`getByRole`)

## CI

- `customer-portal-frontend/DevOps/CI.yml` — same branching as backend
- `develop` → Dev/Test; Acc/Prod via deployment manifest only

## Security

- No API keys or client secrets in source or `.env` committed to git
- Prefer backend-for-frontend or API scopes over exposing privileged tokens in the browser

## Review focus (DevOps demo)

Prioritize build pipeline impact, env configuration, and contract with the .NET API over UI polish.
