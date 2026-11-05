# 01: Package Victor Mono Nerd Font in the channel

**What to build:** Installing the `font-nerd-victor-mono` package from the interleaved channel places the patched Victor Mono Nerd Font files on the system. The font then appears in `fc-list` and works in a terminal. The package also joins the published build set in `manifest.scm`. It becomes the first real package to run through the substitute pipeline. A later pipeline ticket can then build, sign, and serve a substitute for it.

**Blocked by:** None (can start immediately).

**Status:** ready-for-agent

- [ ] A new module `(interleaved packages fonts)` defines a public `font-nerd-victor-mono` package.
- [ ] The package fetches the pre-patched Victor Mono archive from the ryanoasis/nerd-fonts release, pinned by version and sha256 hash.
- [ ] The package builds with the font build system and installs the TrueType files under the standard font path.
- [ ] The command `guix build -L modules font-nerd-victor-mono` succeeds from a clean checkout.
- [ ] After a profile install, the Victor Mono Nerd Font family appears in `fc-list` output.
- [ ] `manifest.scm` lists the package, so it joins the published build set.
