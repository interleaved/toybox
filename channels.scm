;; Pinned upstream Guix revision.  Builds run through
;; `guix time-machine -C channels.scm` against this exact commit so the
;; build box and clients agree on the Guix version, and so substitutes line
;; up with what clients compute.  Bump the commit deliberately.
(list (channel
        (name 'guix)
        (url "https://git.guix.gnu.org/guix.git")
        (branch "master")
        (commit "ba85a5a6cb6626891b1d9a69409d64911900e747")))
