# 02: Datalevin service definition

**What to build:** Adding the Datalevin service to the system configuration runs the Datalevin server as a managed background daemon. The server starts at boot. If the server stops, the service restarts it. A system reconfigure brings the server up with no manual steps.

**Blocked by:** 01 (Package Datalevin). The service runs the package the datalevin ticket produces.

**Status:** ready-for-agent

Open question: the server mode is not settled. The existing package notes a JVM server mode, but that guidance is old. Upstream Datalevin now targets several client languages. So the implementer must first read the current Datalevin repository for the recommended way to run a server.

- [ ] The implementer reads the current Datalevin repository and records the recommended server mode.
- [ ] A Guix system service type runs the Datalevin server as a Shepherd daemon.
- [ ] The daemon starts at boot.
- [ ] After a failure, the daemon restarts.
- [ ] The service configuration sets the data directory and the listening port.
- [ ] A `guix system reconfigure` starts the daemon, and `herd status` shows it running.
- [ ] If the recommended server mode needs a newer Datalevin version, the implementer raises this first.
