Draft a wiki-ready changelog section for Customer Portal release $(Release.ReleaseName).

Inputs (if available as files in the workspace):
- release-manifest.json component versions
- Last 10 commit subjects on main (read-only git log)

Format:
- ## Summary (2–3 sentences)
- ## Components (table: name, version/image)
- ## Operational notes (deploy order, approvals)
- Use ADO wiki Mermaid fences (`::: mermaid`) only if a diagram helps

Output markdown only. No work item IDs. Synthetic customer names only.
