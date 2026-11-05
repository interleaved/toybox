# 02: Engram system service

**What to build:** Adding the engram service to the system configuration runs the engram server as a managed background daemon. The server starts at boot. If the server stops, the service restarts it. A system reconfigure brings the server up with no manual steps. Reaching the daemon over SSH through the engram proxy stays out of scope for this ticket.

**Blocked by:** 01 (Package engram). The service runs the package the engram ticket produces.

**Status:** ready-for-agent

- [ ] A Guix system service type runs the engram package as a Shepherd daemon.
- [ ] The daemon starts at boot.
- [ ] After a failure, the daemon restarts.
- [ ] The service configuration sets the listening port and the data directory.
- [ ] A `guix system reconfigure` starts the daemon, and `herd status` shows it running.
- [ ] The running daemon serves requests on its configured port.
