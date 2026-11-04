# 06: Channel authentication

**What to build:** Cryptographic protection of the channel's own Git history, so a client refuses to pull a tampered history. This is separate from substitute signing and can run in parallel with the build pipeline.

**Blocked by:** 01.

**Status:** ready-for-agent

- [ ] Commits are signed with an OpenPGP key.
- [ ] `.guix-channel` carries an `(introduction …)` anchored to the first signed commit and the key fingerprint.
- [ ] The fingerprint is published in the README.
- [ ] A client pulling the channel verifies the Git history and refuses a tampered history.
