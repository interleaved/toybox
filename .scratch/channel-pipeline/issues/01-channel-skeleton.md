# 01: Channel skeleton with one tracer package

**What to build:** A working Guix channel that a user can add, pull, and install from. It carries one trivial custom package so the whole path can be exercised before any build pipeline exists. This is the foundation every other ticket builds on.

**Blocked by:** None (can start immediately).

**Status:** done

- [x] A `.guix-channel` file exists at the repo root.
- [x] A package module defines one trivial custom package.
- [x] A `channels.scm` pins the exact upstream `guix` commit.
- [x] A `manifest.scm` names the tracer package as the build set.
- [x] A user can add the channel, run `guix pull`, and build and install the package from source.
