# 01: Weekly upstream update discovery

**What to build:** A scheduled action runs every week. It compares each package in the channel with its upstream source. The action reports which packages have a newer upstream version. The report tells the maintainer which packages to bump. The exact report form, such as an opened issue, a pull request, or a written summary, is not decided yet.

**Blocked by:** None (can start immediately).

**Status:** needs-triage

This ticket is a stub. The approach is undecided. Record open questions below.

- [ ] Decide the trigger: a weekly schedule, a manual run, or both.
- [ ] Decide the scope: which packages the action tracks.
- [ ] Decide how the action discovers the latest upstream version for each package type.
- [ ] Decide the report form: an opened issue, a pull request, or a written summary.
- [ ] Decide where the action runs and how it authenticates.

Prior art: syncopate has a weekly version watcher that fetches upstream, computes the target versions, and opens a pull request. This watcher can serve as a model.
