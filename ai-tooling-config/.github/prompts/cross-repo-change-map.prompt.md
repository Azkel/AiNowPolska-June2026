Produce a **cross-repo change map** for the user's request in the Customer Portal workspace.

**Steps:**

1. Parse scope (IaC, pipelines, app, wiki, deployment manifest, or shared tags/variables).
2. List affected repos under `customer-portal-*` and `ai-tooling-config` if relevant.
3. For each repo: files to touch, dependency order, and validation (`terraform validate`, pipeline dry-run, build).
4. Specify merge order (e.g. infrastructure → backend/frontend → deployment manifest → wiki).
5. Name the wiki page to update and whether `docs/change-YYYY-MM-DD-*.md` is needed at workspace root.
6. Include rollback per repo.

**Output format:**

```markdown
## Summary
(one paragraph)

## Change map
| Order | Repo | Files | Validation |
|-------|------|-------|------------|

## Merge / release
(branch targets, manifest impact for Acc/Prod)

## Rollback
(per repo)

## Wiki
(page path + section)
```

Do not implement changes until the user approves the map.
