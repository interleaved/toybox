# 01: Package engram in the channel

**What to build:** Installing the `engram` package from the interleaved channel places the engram memory server on the system as a runnable program. The package builds the server from its source and wraps it to run on a JVM. A single command then starts the server. The package also joins the published build set in `manifest.scm`.

**Blocked by:** None (can start immediately).

**Status:** ready-for-agent

- [ ] A new `(interleaved packages engram)` module defines a public `engram` package.
- [ ] The package builds engram from its source repository, pinned by commit or version.
- [ ] The build produces the server artifact and a wrapper that runs it on a JVM.
- [ ] The command `guix build -L modules engram` succeeds from a clean checkout.
- [ ] Running the installed command starts the engram server and it listens on its configured port.
- [ ] `manifest.scm` lists the package, so it joins the published build set.
