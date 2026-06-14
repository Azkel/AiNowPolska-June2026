---
applyTo: "customer-portal-wiki/**/*.md,**/.wiki/**/*.md"
description: "Azure DevOps Wiki markdown and Mermaid for Customer Portal runbooks"
---

# Azure DevOps Wiki (Customer Portal)

Adapted from awesome-copilot wiki/Markdown guidance for ADO-hosted wikis cloned as Git.

## Mermaid (required syntax)

Azure DevOps wiki uses **triple-colon fences**, not GitHub-style backticks:

```markdown
::: mermaid
flowchart LR
  develop --> main
:::
```

Do not use ` ```mermaid ` in wiki pages in this workspace.

## Runbook structure

Operator-facing pages should include:

1. **Purpose** — one short paragraph
2. **Prerequisites** — permissions, tools, environment names (`Dev`, `Test`, `Acceptance`, `Production`)
3. **Steps** — numbered, link to pipeline names and repo paths
4. **Validation** — how to confirm success
5. **Rollback** — safe reversal; link to manifest or previous release when relevant

## Style

- Short procedural steps; tables for environment matrix
- Link to `customer-portal-*` repos by folder name, not internal ADO URLs with real org names unless provided
- No fake ticket numbers; no employee or customer PII unless supplied for the demo
- Task lists: `- [ ]` / `- [x]` (GFM) work in ADO wiki

## MCP workflow

1. `wiki_get_page_content` / `wiki_list_pages` (read-only)
2. Propose diff-style markdown for the user to commit to the wiki git remote
3. Never call mutating wiki tools

Reference: [ADO wiki Markdown guidance](https://learn.microsoft.com/en-us/azure/devops/project/wiki/markdown-guidance?view=azure-devops)
