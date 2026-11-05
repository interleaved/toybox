# 01: Package Claude Code in the channel

**What to build:** Installing the `claude-code` package from the interleaved channel places the Claude Code command line tool on the system. The package wraps the current upstream release as a runnable command. A `claude` command then launches it. The package also joins the published build set in `manifest.scm`.

**Blocked by:** None (can start immediately).

**Status:** ready-for-agent

- [ ] A new `(interleaved packages claude-code)` module defines a public `claude-code` package.
- [ ] The package fetches the current upstream Claude Code release, pinned by version and sha256 hash.
- [ ] The package wraps the release as a runnable command on this system.
- [ ] The command `guix build -L modules claude-code` succeeds from a clean checkout.
- [ ] Running the installed `claude` command starts Claude Code.
- [ ] `manifest.scm` lists the package, so it joins the published build set.
