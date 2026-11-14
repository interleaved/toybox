# Interleaved Guix Channel

A Guix channel of custom package definitions on top of upstream Guix. It also
carries a pipeline that builds, signs, and distributes pre-built substitutes for
those packages.

## Channel authentication

This channel signs its Git history with an OpenPGP key, so a client can refuse a
tampered history. The key fingerprint is:

    2226 989B 8985 4EF0 3467  36FB 06A0 0511 3B4F 5784

A client anchors trust to this fingerprint through a channel introduction in its
`channels.scm` file. The introduction also names the first signed commit of the
public channel. When the public channel is available, that value appears here.
