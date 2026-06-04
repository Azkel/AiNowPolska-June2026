Update the selected wiki page (or draft a new section) for operators.

**Constraints:**

- Azure DevOps wiki Mermaid: use `::: mermaid` … `:::` fences, not GitHub ```mermaid
- Short procedural steps; link to pipeline names and repo paths
- No internal employee names or customer-specific branding unless provided
- Include validation and rollback subsections

If MCP wiki tools are available, read the current page with `wiki_get_page_content` first, then propose a diff-style markdown block for the user to commit to the wiki git repo.
