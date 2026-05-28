# Upstream Sync Procedure

```bash
git fetch upstream
git checkout main
git merge --ff-only upstream/main
git push origin main
```

## Rules
- Use fast-forward only when possible.
- Do not resolve large upstream conflicts blindly.
- Never sync from upstream with uncommitted local changes.
- Keep DIOX overlay isolated to reduce conflicts.
