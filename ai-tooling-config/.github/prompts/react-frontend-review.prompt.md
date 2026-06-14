Review the selected React + TypeScript frontend for Customer Portal:

1. **Build & env** — API base URL from env; no secrets in bundle or committed `.env`
2. **Auth** — MSAL/Entra patterns when present; tokens not logged
3. **API contract** — typed calls to backend; error/loading states
4. **Accessibility** — labels, roles, keyboard use on interactive elements
5. **CI** — `DevOps/CI.yml` triggers, Node version, artifact paths; flag YAML edits for human review

Output: table of findings (severity, file, suggestion). Compliant | Needs improvement | Non-compliant per row.

Do not refactor UI unless asked; focus on DevOps-relevant quality and pipeline safety.
