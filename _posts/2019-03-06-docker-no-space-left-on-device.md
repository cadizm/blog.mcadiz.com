---
layout: post
title: "Docker: No space left on device"
date: Wed Mar  6 11:37:07 PST 2019
---

TL;DR

```
$ du -hs ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/
 63G
$ docker ps -q -f 'status=exited' | xargs docker rm
$ docker images -q -f 'dangling=true' | xargs docker rmi
$ du -hs ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/
 16G
```

Couldn't bring up docker container since db connection failed. Taking a
closer look at the db container showed the following:

```
...
db_1 | FATAL: could not write lock file "/var/run/postgresql/.s.PGSQL.5432.lock": No space left on device
...
```

Google search turned up the following blog post in slot 2: ["No space left on device" on OSX Docker](https://www.peterbe.com/plog/no-space-left-on-device-on-osx-docker)
which somewhat explains the 64G cap on total storage for Docker on OS X.
