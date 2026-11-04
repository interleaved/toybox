# 04: Mirror the cache to R2 and install from substitute

**What to build:** The first true end-to-end slice. The signed publish cache is mirrored to a public R2 bucket. A client then installs the tracer package from a pre-built substitute instead of building from source.

**Blocked by:** 03.

**Status:** ready-for-agent

- [ ] An R2 bucket is created with public read behind a Cloudflare custom domain.
- [ ] The workflow syncs the publish cache to the bucket root with rclone.
- [ ] R2 S3 keys are stored as GitHub Actions secrets and read by the runner job.
- [ ] A client that adds the base URL and authorizes the public key installs the tracer package from a substitute, not from source.
