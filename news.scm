;; Channel news for the interleaved-guix channel.
;; Each entry names a commit in the public channel history.  Guix shows an
;; entry when its commit is new to the pulling client.  The dedicated news flow
;; (ci/mirror-news.sh) publishes this file and checks every commit hash against
;; the public history before it pushes.  See ticket 09 and docs/adr/0011.
(channel-news
  (version 0)

  (entry (commit "0302c7e0a60bf352398f94a4c632939fdfb3e4a9")
    (title (en "The build report is live"))
    (body (en "A public build report is now online at
https://status.interleaved.io/. It shows each day's pipeline run and the
pass or fail result of every package."))))
