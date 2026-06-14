---
name: react-frontend
description: >-
  Review and scaffold Customer Portal React + TypeScript frontend and its
  DevOps/CI.yml. Use for env config, API integration, and pipeline checks.
---

# React Frontend (Customer Portal)

## Repo

- `customer-portal-frontend/` — stub today; pipeline in `DevOps/CI.yml`
- Pairs with `customer-portal-backend` API

## When helping

- Prefer typed API clients and env-based configuration
- Entra ID via MSAL React when auth is added
- Flag `DevOps/CI.yml` changes for human review

## Prompts

Use Copilot prompt `react-frontend-review` for structured reviews.

## Do not

- Commit secrets or production URLs in source
- Deploy to Acc/Prod from this repo's CI (manifest-only path)
