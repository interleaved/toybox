# Build and distribution architecture

We build substitutes on a self-hosted GitHub Actions runner on a local box. The build generates a signed static publish cache with `guix publish`. We mirror that cache to a public Cloudflare R2 bucket, which clients use as their substitute server. We chose this over the standard Guix setup of Cuirass plus a running `guix publish` server. The whole lifecycle then lives in this repo as code. The heavy, memory-intensive builds run on hardware we already control. Distribution needs no always-on server, only static object storage.

## Considered options

- **Cuirass plus a `guix publish` server**: the standard Guix build farm. Rejected for three reasons. It is a second long-running service to operate. It does not naturally live in this repo. It needs an always-on host to serve substitutes.
- **Hosted CI (GitHub-hosted runners)**: rejected because builds can be arbitrarily memory and time intensive, which hosted runners cannot absorb.

## Consequences

- R2 is an exact mirror of the local publish cache, so retention is enforced locally with GC roots plus `guix gc`, then synced with delete. This is required because the R2 free tier caps at 10GB.
- The substitute signing private key lives only on the build box. If that box is lost, the key must be restored from an offline backup or rotated, and clients must authorize the new key.
- Status data for the build-report page must live outside the mirrored prefix, or the sync-with-delete step erases it.
