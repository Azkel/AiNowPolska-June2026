# Demo scenarios for the webinar

Short scripts you can run live. Each assumes MCP and Copilot/Cursor are configured.

**Presenter guides:** Use your own runbook for setup, clicks, and fallbacks. See [`getting-started.md`](./getting-started.md) for attendee setup.

## Scenario A — Investigate a failed pipeline (MCP)

**Setup:** Reference a real or fictional build ID in your ADO project.

**Prompt:**

> Using Azure DevOps MCP (read-only), summarize build `<BUILD-ID>`: status, failing stage, and last 30 lines of the log. Suggest a fix in the repo without editing YAML yet.

**Talking points:** Schema-first tool use, read-only policy, human applies fix.

---

## Scenario B — Draft a wiki runbook section

**Setup:** Open `customer-portal-wiki/.../Deployment-Overview.md`.

**Prompt:** Run `wiki-runbook-update` prompt — add a “Rollback” subsection.

**Talking points:** Wiki git repo in workspace, ADO Mermaid syntax, commit from IDE.

---

## Scenario C — Terraform review

**Setup:** Open `customer-portal-infrastructure/terraform/main.tf`.

**Prompt:** Run `terraform-plan-review` prompt.

**Talking points:** fmt/validate locally; MCP for read-only Azure checks; no auto-apply.

---

## Scenario D — .NET API review

**Setup:** Open `customer-portal-backend/src/Portal.Api/Program.cs`.

**Prompt:** Run `dotnet-api-review` prompt.

---

## Scenario E — Multi-repo change map

**Prompt:**

> We need a new environment tag on all Terraform resources. Produce a change map: which repos/files, merge order, and wiki page to update.

**Talking points:** `AGENTS.md` cross-repo rules, `docs/change-*.md` planning pattern.

---

## Scenario F — Agent CLI in pipeline (outline)

**Setup:** Show `templates/agent-cli/azure-pipelines-copilot-agent.yml`.

**Talking points:** Non-interactive agent on ADO agent, artifact output, human approval before merge/deploy.

---

## Scenario G — Shared config repo

Show `ai-tooling-config/` and the copy script in its README — one place for prompts, MCP, instructions.
