# Interleaved Guix Channel

<p align="center">
  <img src="https://cdn.interleaved.io/report/assets/big_logo.avif" alt="interleaved/toybox" width="200">
</p>

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
  (name 'toybox)
  (url "https://github.com/interleaved/toybox.git")
  (branch "main")
  (introduction
   (make-channel-introduction
    "ee66ea930e97611f69d9842e81321f86e1476c34"
    (openpgp-fingerprint
     "2226 989B 8985 4EF0 3467  36FB 06A0 0511 3B4F 5784"))))
```

## Using substitutes

This channel serves pre-built binaries from a substitute server. A substitute is
a pre-built binary that Guix downloads instead of a local build. To use the
server, authorize its signing key and add its URL. The server carries only this
channel's packages, so keep the default servers in the list.

Authorizing the key is an administrator task. Guix trusts the key at the daemon
level, so a user without root cannot do it alone.

### On Guix System

Add a service to the `services` field of your `operating-system`. It extends the
Guix service with the substitute URL and the signing key, on top of the
defaults. Then reconfigure the system.

```scheme
(simple-service 'toybox-substitutes guix-service-type
  (guix-extension
   (substitute-urls (list "https://cdn.interleaved.io/guix"))
   (authorized-keys
    (list (plain-file "toybox-substitutes.pub"
                      "(public-key
 (ecc
  (curve Ed25519)
  (q #E5A0FA6C24D529F897F4CFA76DB18DBEB2D373B0E80B5B5F3FC243ECC6A3C99C#)))")))))
```

Reconfigure the system to apply it:

```
sudo guix system reconfigure /etc/system.scm
```

### On a foreign distribution

Authorize the signing key as root. Guix refuses a substitute from an unknown
key.

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

Then add the URL to the guix-daemon. Pass
`--substitute-urls='https://ci.guix.gnu.org https://cdn.interleaved.io/guix'` to
the daemon. Then restart it. See the Guix manual section on substitute server
authorization.

## Installing packages

After you add the channel and run `guix pull`, Guix knows the packages by name.
The channel provides `font-nerd-victor-mono`, `font-nerd-hack`, and `tracer`.

Install one package into your profile:

```
guix install font-nerd-victor-mono
```

For a standing order, list the packages in a manifest or a Guix Home
configuration.

Use a manifest file at `~/manifest.scm`:

```scheme
(specifications->manifest
 (list "font-nerd-victor-mono"
       "font-nerd-hack"))
```

Apply the manifest:

```
guix package -m ~/manifest.scm
```

Use a Guix Home configuration at `~/guix-home-config.scm`:

```scheme
(use-modules (gnu home)
             (gnu packages))

(home-environment
 (packages
  (specifications->packages
   (list "font-nerd-victor-mono"
         "font-nerd-hack"))))
```

Apply the home configuration:

```
guix home reconfigure ~/guix-home-config.scm
```

## Build status

The pipeline builds and signs the channel, then publishes a status page.

[The build report](https://status.interleaved.io/) shows every day the pipeline
ran, each run, and each package.

The SHAs on the status page do not match the commits you pull. The status page
reports the commits of the source repository, where the builds run. The public
channel is a signed snapshot mirror of that repository. Each snapshot is a fresh
commit with its own SHA, and its commit message names the source commit it
mirrors. So a channel commit and a build SHA differ by design.
