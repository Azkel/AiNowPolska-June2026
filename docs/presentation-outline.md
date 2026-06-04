# Presentation outline (suggested flow)

1. **Problem** — Many ADO repos, wiki, IaC; context switching kills productivity.
2. **Workspace** — Multi-root VS Code workspace + `AGENTS.md` as the contract.
3. **Shared config repo** — One place for Copilot instructions, MCP, prompts, skills.
4. **MCP live** — Read-only investigation (build, work item, wiki page).
5. **Wiki in git** — Edit runbook in IDE; Mermaid ADO syntax; push to wiki remote.
6. **Domain prompts** — Pipeline / Terraform / .NET review in one click.
7. **Agent CLI** — Scheduled or PR pipeline runs Copilot CLI; artifact for human review.
8. **Governance** — Read-only MCP, plan-first, no auto-deploy from agents.

## Repo map for slides

```
AGENTS.md          → rules of engagement
ai-tooling-config  → DRY for AI config
customer-portal-*  → realistic multi-repo layout (stubs)
templates/         → what attendees copy home
```

## Customization before GitHub publish

Replace `<ADO-ORG>`, `<ADO-PROJECT>`, `<ACR-NAME>` in README and MCP JSON.

Remove or rewrite any section that references your real employer — this demo uses **Contoso / Customer Portal** fiction only.
