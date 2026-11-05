# 01: Package Datalevin in the channel

**What to build:** Installing the `datalevin` package from the interleaved channel places the `dtlv` command on the system. The command runs as a native binary and also runs the server on a JVM. The package is a port of the existing tested definition and its sibling lock file. The package also joins the published build set in `manifest.scm`.

**Blocked by:** None (can start immediately).

**Status:** ready-for-agent

- [ ] A new `(interleaved packages datalevin)` module ports the existing `datalevin.scm` definition.
- [ ] The `datalevin-deps.lock` file must sit beside the module as a sibling. The definition reads the lock through its own source location.
- [ ] The package builds the `dtlv` native binary with GraalVM native-image, with the GraalVM toolchain defined inline.
- [ ] The package also bundles the JVM server mode.
- [ ] The command `guix build -L modules datalevin` succeeds from a clean checkout.
- [ ] Running the installed `dtlv` command works for a basic command.
- [ ] `manifest.scm` lists the package, so it joins the published build set.
