# Channel authentication

We enable Guix channel authentication. Commits are signed with an OpenPGP key. The `.guix-channel` file records an introduction. The introduction anchors the first signed commit and the key fingerprint, which the README publishes. We chose this to close a real hole. Without it, anyone who can push to the GitHub repo can ship code to users' machines with no cryptographic check. Channel authentication lets clients refuse a tampered Git history.

## Consequences

- The introduction is a permanent anchor. Changing the anchor commit or the key later forces every user to update their channel configuration, so the key choice is effectively long-lived.
- Every published commit must be signed, which the release workflow and any human committer must honor.
- This is distinct from substitute signing. The two use different keys and protect different things: this protects the channel's source history, substitute signing protects the binaries.
