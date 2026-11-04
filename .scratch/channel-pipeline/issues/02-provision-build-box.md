# 02: Provision the build box (self-hosted runner and signing key)

**What to build:** The local box set up as the compute host for the pipeline: registered as a self-hosted GitHub Actions runner, and holding the substitute signing key. This is mostly a one-time manual provisioning step.

**Blocked by:** None (can start immediately).

**Status:** ready-for-agent

- [ ] The local box is registered as a self-hosted GitHub Actions runner and shows online.
- [ ] An Ed25519 substitute signing keypair is generated on the box with `guix archive --generate-key`.
- [ ] The private key stays on the box, and one offline backup is made.
- [ ] The public key is committed to the repo.
- [ ] The private key is never committed and never stored in GitHub Actions secrets.
