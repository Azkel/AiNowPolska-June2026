You are running in CI on an Azure DevOps agent. Read-only policy applies.

Context:
- Organization: <ADO-ORG>
- Project: <ADO-PROJECT>
- Pipeline: $(Build.DefinitionName)
- Build ID: $(Build.BuildId)

Task:
1. If Azure DevOps MCP is available, fetch the latest failed build for this definition (read-only).
2. Summarize: failing stage/job, error excerpt, likely root cause, suggested fix (files only — do not edit).
3. Output markdown under 80 lines suitable for a PR comment.

Do not expose tokens, PATs, or secret variable values.
