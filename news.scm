;; Channel news for the interleaved-guix channel.
;; Each entry names a commit in the public channel history.  Guix shows an
;; entry when its commit is new to the pulling client.  The dedicated news flow
;; (ci/mirror-news.sh) publishes this file and checks every commit hash against
;; the public history before it pushes.  See ticket 09 and docs/adr/0011.
(channel-news
  (version 0)

  (entry (commit "680c8a6b57e9ca95bbe3b45606231fb9c2a1e7cd")
    (title (en "Two Nerd Fonts join the channel"))
    (body (en "Victor Mono Nerd Font and Hack Nerd Font are now in the
channel. Run guix pull, then guix install, to get either one. Both carry
the full Nerd Font glyph set.")))

  (entry (commit "0302c7e0a60bf352398f94a4c632939fdfb3e4a9")
    (title (en "The build report is live"))
    (body (en "A public build report is now online at
https://status.interleaved.io/. It shows each day's pipeline run and the
pass or fail result of every package."))))
