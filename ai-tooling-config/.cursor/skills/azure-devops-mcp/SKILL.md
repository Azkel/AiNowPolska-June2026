---
name: azure-devops-mcp
description: >-
  Query Azure DevOps via MCP (work items, pipelines, repos, wiki) read-only.
  Use when investigating builds, drafting docs from wiki, or triaging backlog items.
---

# Azure DevOps MCP (read-only)

## Before calling tools

1. List/read tool schemas for the Azure DevOps MCP server.
2. Set context: organization `<ADO-ORG>`, project `<ADO-PROJECT>`.

## Tool selection

| Goal | Tools |
|------|--------|
| Failed build | `pipelines_get_builds`, `pipelines_get_build_log`, `pipelines_get_run` |
| PR / branch | `repo_get_pull_request_by_id`, `repo_get_branch_by_name`, `repo_search_commits` |
| Work item | `wit_get_work_item`, `wit_query_by_wiql`, `search_workitem` |
| Wiki | `wiki_get_page_content`, `wiki_list_pages`, `search_wiki` |
| Code search | `search_code` |

## Policy

- Refuse mutating tools (`_create_`, `_update_`, `_run_`, etc.).
- Summarize with build IDs, PR IDs, and links — do not paste secrets from logs.

## Fallback

If MCP auth fails, tell the user to run `mcp_auth` (Cursor) or sign in via VS Code MCP UI, then retry.
