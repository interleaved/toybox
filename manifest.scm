;; The build set: the packages this channel builds and publishes.
;; Build it locally with:  guix build -L modules -m manifest.scm
;; It is deliberately narrower than the full set of definitions in the channel.
(use-modules (interleaved packages tracer))

(packages->manifest (list tracer))
