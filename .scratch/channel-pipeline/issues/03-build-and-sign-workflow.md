# 03: Build-and-sign workflow producing a signed publish cache

**What to build:** A GitHub Actions workflow, run by the self-hosted runner, that builds the manifest reproducibly and writes a signed static publish cache. This is the compute half of the pipeline, verifiable before R2 exists.

**Blocked by:** 01, 02.

**Status:** ready-for-agent

- [ ] The workflow runs on the self-hosted runner, triggered on push to `main` and manual dispatch.
- [ ] The build runs through `guix time-machine -C channels.scm` against the pinned commit.
- [ ] The build targets `manifest.scm`.
- [ ] `guix publish` writes a signed static publish cache.
- [ ] On partial failure, every output that built is published and the run fails loudly.
- [ ] A run produces signed narinfos locally.
