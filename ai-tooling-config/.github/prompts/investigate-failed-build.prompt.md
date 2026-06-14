Investigate a failed Azure DevOps pipeline run (read-only).

**Inputs:** Build ID or pipeline name (user provides at least one).

**Steps:**

1. Read Azure DevOps MCP tool schemas; refuse mutating tools.
2. Fetch build/run status, failing stage/job, and last ~30 lines of relevant log (`pipelines_get_builds`, `pipelines_get_build_log`, `pipelines_get_run`).
3. Correlate with repo: which `customer-portal-*` repo and branch; check if change touched `DevOps/CI.yml` or `azure-pipelines.yml`.
4. Summarize root cause hypothesis with evidence (log excerpt, stage name).
5. Propose a **fix as a diff or bullet list** — do not edit YAML until the user approves.

**Output format:**

| Field | Value |
|-------|--------|
| Build | ID, status, branch, commit |
| Failed stage | name + error snippet |
| Likely cause | 1–3 sentences |
| Suggested fix | actionable steps |
| Human next step | who applies the fix, how to re-run |

Reference workspace branching: `customer-portal-wiki/CustomerPortal/Operations/Branching-and-Deployments.md`.
