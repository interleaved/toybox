(define-module (interleaved packages tracer)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash))

;; tracer is a deliberately trivial package.  It installs one small script
;; and pulls in only bash-minimal.  Its job is to exercise the channel end to
;; end (definition, pull, build, install) before any build pipeline exists.
(define-public tracer
  (package
    (name "tracer")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (script (string-append bin "/tracer")))
            (mkdir-p bin)
            (call-with-output-file script
              (lambda (port)
                (format port "#!~a/bin/bash~%echo 'interleaved-guix tracer OK'~%"
                        #$bash-minimal)))
            (chmod script #o555)))))
    (synopsis "Minimal end-to-end check package for the channel")
    (description
     "A trivial package that installs a small @command{tracer} script.  It
exists to exercise the channel end to end before the build pipeline exists.")
    (home-page "https://github.com/crinklywrappr/interleaved-guix")
    (license license:gpl3+)))
