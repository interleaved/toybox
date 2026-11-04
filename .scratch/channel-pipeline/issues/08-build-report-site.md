# 08: GitHub Pages build-report site

**What to build:** A lightweight Cuirass-like status page that reports build history and success. GitHub Pages hosts it, and the pipeline feeds it data on every run.

**Blocked by:** 04.

**Status:** ready-for-agent

- [ ] Each workflow run appends a JSON record to a `status/` area the mirror never deletes.
- [ ] The record holds per-package pass/fail, duration, channel commit, store size, and bucket size.
- [ ] A static page is deployed to GitHub Pages from the workflow.
- [ ] The page renders latest status and history.
