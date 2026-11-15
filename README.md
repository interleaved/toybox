# Interleaved Guix Channel

A Guix channel of custom package definitions on top of upstream Guix.

## Channel authentication

This channel signs its Git history with an OpenPGP key, so a client can refuse a
tampered history. The key fingerprint is:

```
2226 989B 8985 4EF0 3467  36FB 06A0 0511 3B4F 5784
```

A client anchors trust to this fingerprint through a channel introduction in its
`channels.scm` file. The introduction also names the first signed commit of the
public channel.

## Using the channel

Add this channel entry to your `channels.scm`, then pull.

```scheme
(channel
  (name 'interleaved)
  (url "https://github.com/interleaved/toybox.git")
  (introduction
   (make-channel-introduction
    "ee66ea930e97611f69d9842e81321f86e1476c34"
    (openpgp-fingerprint
     "2226 989B 8985 4EF0 3467  36FB 06A0 0511 3B4F 5784"))))
```

## Using substitutes

This channel serves pre-built binaries from a substitute server, so you do not
build every package from source. A substitute is a pre-built binary that Guix
downloads instead of compiling locally. To use the server, you authorize its
signing key and add its URL.

First, authorize the signing key. The server signs each substitute with this
key, and Guix refuses a substitute from an unknown key. Run this command as
root:

```
guix archive --authorize <<EOF
(public-key
 (ecc
  (curve Ed25519)
  (q #E5A0FA6C24D529F897F4CFA76DB18DBEB2D373B0E80B5B5F3FC243ECC6A3C99C#)
  )
 )
EOF
```

Then add the substitute URL. Pass it to a build alongside the default server:

```
guix build tracer \
  --substitute-urls='https://ci.guix.gnu.org https://cdn.interleaved.io/guix'
```

Keep `https://ci.guix.gnu.org` in the list, because this server carries only
the channel's own packages. To make the change permanent, add the URL to the
guix-daemon substitute URLs. See the Guix manual section on substitute server
authorization.
