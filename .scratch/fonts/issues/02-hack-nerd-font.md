# 02: Package Hack Nerd Font in the channel

**What to build:** Installing the `font-nerd-hack` package from the interleaved channel places the patched Hack Nerd Font files on the system. The font then appears in `fc-list` and works in a terminal. The package also joins the published build set in `manifest.scm`. It follows the same pattern as the Victor Mono font package.

**Blocked by:** None (can start immediately). The `(interleaved packages fonts)` module is created by whichever font ticket runs first. If the module does not yet exist, this ticket creates it.

**Status:** ready-for-agent

- [ ] The `(interleaved packages fonts)` module defines a public `font-nerd-hack` package.
- [ ] The package fetches the pre-patched Hack archive from the ryanoasis/nerd-fonts release, pinned by version and sha256 hash.
- [ ] The package builds with the font build system and installs the TrueType files under the standard font path.
- [ ] The command `guix build -L modules font-nerd-hack` succeeds from a clean checkout.
- [ ] After a profile install, the Hack Nerd Font family appears in `fc-list` output.
- [ ] `manifest.scm` lists the package, so it joins the published build set.
