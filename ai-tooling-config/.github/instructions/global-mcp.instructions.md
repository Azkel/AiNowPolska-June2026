---
applyTo: "**"
---

# Global MCP Instructions (Demo)

## 1. Whitelist

Permitted MCP servers:

1. MCP servers from [awesome-copilot](https://github.com/github/awesome-copilot) (official catalog).
2. MCPs bundled with official Microsoft or GitHub IDE extensions.
3. Microsoft **Azure MCP** (`@azure/mcp`) — **read-only**.
4. Microsoft **Azure DevOps MCP** (`@azure-devops/mcp`) — **read-only** (instruction-enforced).

Refuse any other server unless your organization has explicitly approved it.

## 2. Azure MCP — read-only

- Verify `--read-only` is present in server args (see [`../mcp/azure-mcp.readonly.json`](../mcp/azure-mcp.readonly.json)).
- Never use mutating tool arguments or deploy/apply operations via MCP.
- For writes, suggest equivalent `az` / Terraform / Bicep for a human to run.

## 3. Azure DevOps MCP — read-only

Allowed name patterns (examples): `wit_get_*`, `wit_list_*`, `wit_query_*`, `pipelines_get_*`, `repo_get_*`, `repo_list_*`, `repo_search_*`, `wiki_get_*`, `wiki_list_*`, `search_*`.

Blocked: tools containing `_create_`, `_update_`, `_delete_`, `_run_`, `_merge_`, `_link_`, `_add_`, `_set_`, and similar mutating verbs.

If semantics are unclear, treat as write and refuse.

## 4. Never via MCP

- Run pipelines or change infrastructure
- Commit or push code
- Modify production data

## 5. Reporting

If Azure MCP runs without `--read-only`, stop and notify the user before calling tools.
