# Interleaved Guix Channel

A Guix channel that provides a focused set of custom package definitions on top of upstream Guix. It also holds the pipeline that builds, signs, and distributes pre-built binaries for those packages.

## Language

**Channel**:
A Git repository of Guile package definitions that users add to their Guix configuration and pull. It holds source and definitions, never the builds.

**Substitute**:
A pre-built binary for one package output, so a user installs it without building from source.
_Avoid_: build artifact, cache entry

**Nar**:
The compressed archive file that carries the actual bytes of one substitute.

**Narinfo**:
The small metadata file describing one substitute: its store path, references, size, and signature. A narinfo points at a nar.

**Substitute server**:
The HTTP endpoint a Guix client fetches substitutes from, identified by a substitute base URL. Here it is a public R2 bucket behind a custom domain, serving static files.
_Avoid_: binary cache, mirror

**Signing key**:
The Ed25519 keypair that signs substitutes. The private key proves a substitute came from this project. Clients install only substitutes signed by an authorized key.

**Channel authentication**:
The separate mechanism that verifies the channel's own Git history, using OpenPGP-signed commits and a recorded introduction. It is unrelated to substitute signing.

**Channel introduction**:
The fixed anchor, stored in `.guix-channel`, that names the first signed commit and the OpenPGP fingerprint a client must trust before pulling.

**Manifest**:
The committed list of packages and outputs to build and publish. It is the source of truth for the build set, which is narrower than the full set of definitions in the channel.

**Channel revision**:
One built state of the channel at a specific commit. Retention keeps the newest revisions that fit the storage budget and prunes the oldest.

**Publish cache**:
The local directory of narinfo and nar files that `guix publish` writes. R2 is kept as an exact mirror of this directory.

**GC root**:
A marker on the build box that stops `guix gc` from deleting a retained channel revision. Pruning removes the oldest roots, then collects what nothing retained still references.
