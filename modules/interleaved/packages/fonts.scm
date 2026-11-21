(define-module (interleaved packages fonts)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:))

;; Pre-patched Nerd Fonts from the ryanoasis/nerd-fonts releases.  Each release
;; archive already carries the patched glyphs, so the build only unpacks the
;; archive and installs the font files.  See .scratch/fonts/issues for the
;; tickets.

(define-public font-nerd-victor-mono
  (package
    (name "font-nerd-victor-mono")
    (version "3.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ryanoasis/nerd-fonts/releases/"
                           "download/v" version "/VictorMono.tar.xz"))
       (sha256
        (base32 "1v8ma9aqxf7a7my51ly5wv0lclb9yp6bpvdp2hiqcd8qj9bjdif6"))))
    (build-system font-build-system)
    (synopsis "Victor Mono patched with Nerd Fonts glyphs")
    (description
     "Victor Mono is a monospace font with semi-connected cursive italics and
programming symbol ligatures.  This package ships the Nerd Fonts patched build,
which adds icon glyphs from Font Awesome, Devicons, Octicons, and other icon
sets.  The icons let the font show status symbols in terminals and editors.")
    (home-page "https://www.nerdfonts.com/")
    ;; Victor Mono itself is OFL.  The Nerd Fonts tooling and the patched glyph
    ;; layer are Expat.  The bundled icon sets carry their own upstream licenses.
    (license (list license:silofl1.1 license:expat))))

(define-public font-nerd-hack
  (package
    (name "font-nerd-hack")
    (version "3.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ryanoasis/nerd-fonts/releases/"
                           "download/v" version "/Hack.tar.xz"))
       (sha256
        (base32 "0g4w3lak2pcpbdrv5l2zmwka5y5lharz23ql40ajdqhh5r3qklyd"))))
    (build-system font-build-system)
    (synopsis "Hack patched with Nerd Fonts glyphs")
    (description
     "Hack is a monospace font for source code, built on the DejaVu and
Bitstream Vera families.  This package ships the Nerd Fonts patched build, which
adds icon glyphs from Font Awesome, Devicons, Octicons, and other icon sets.
The icons let the font show status symbols in terminals and editors.")
    (home-page "https://www.nerdfonts.com/")
    ;; Hack is Expat, with the DejaVu public-domain layer and the Bitstream Vera
    ;; X11-style license underneath.  The Nerd Fonts tooling is also Expat, and
    ;; the bundled icon sets carry their own upstream licenses.
    (license (list license:expat
                   license:public-domain
                   (license:x11-style
                    "https://www.gnome.org/fonts/#Final_Bitstream_Vera_Fonts"
                    "Bitstream Vera License")))))
