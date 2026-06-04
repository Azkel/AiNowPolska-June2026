Draft an Azure DevOps Product Backlog Item from the user's description.

**Format:**

- **Title** — one line, imperative
- **Description** — problem, outcome, out of scope (short bullets)
- **Acceptance criteria** — testable Given/When/Then or checkbox list
- **Tasks** — 3–7 implementation tasks for DevOps (pipelines, IaC, docs)
- **Tags** — `devops`, environment names if relevant

**Rules:**

- No fake ticket numbers
- Do not call `wit_create_work_item` — output markdown for the user to paste into ADO
- If MCP is available, use `search_workitem` to find duplicates first
