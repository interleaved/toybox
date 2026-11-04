# 07: Consumption README and directory listing

**What to build:** Everything a new user needs to adopt the channel, plus getting it listed on the public channel directory. This ships the public half of the signing and authentication work.

**Blocked by:** 04, 06.

**Status:** ready-for-agent

- [ ] The README documents the `channels.scm` entry, the substitute base URL, and the public key with its `guix archive --authorize` command.
- [ ] The directory `subscriptionSnippet` matches the `channels.scm` entry, including the introduction.
- [ ] A `git send-email` patch is sent to `~whereiseveryone/toys@lists.sr.ht` adding the channel.
- [ ] The `git send-email` command is documented in the repo so the step is reproducible.
