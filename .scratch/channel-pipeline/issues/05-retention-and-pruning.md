# 05: Retention and pruning under the 10GB cap

**What to build:** Keep R2 under the 10GB free-tier cap while holding a rich history. R2 becomes an exact mirror of a locally pruned publish cache, pruned oldest-first by channel revision.

**Blocked by:** 04.

**Status:** ready-for-agent

- [ ] A GC root is registered per channel revision on the build box.
- [ ] Pruning drops the oldest revisions first to an ~8GB budget, then runs `guix gc`.
- [ ] `rclone sync --delete` makes R2 exactly mirror the pruned cache.
- [ ] The `status/` prefix is excluded from the delete so build-report data survives.
- [ ] No narinfo is ever left pointing at a missing nar.
