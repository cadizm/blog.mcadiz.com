---
layout: post
title: "Docker detach"
date: Fri May  4 11:30:56 PDT 2018
---

Goal: [attach](https://docs.docker.com/engine/reference/commandline/attach/) to
a running Docker container and then detach without killing it.

Two possbile solutions:

1. Always remember to spin up ([exec](https://docs.docker.com/engine/reference/commandline/exec/)/[run](https://docs.docker.com/engine/reference/commandline/run/))
containers using the `-i -t`  flags (interactive and pseudo-tty respecively) so that you can use the detach key sequence
(`ctl-p, ctrl-q` by default) to actually detach from the container.

2. Pass `--sig-proxy=false` when you attach so that `SIGKILL` is not proxied to the container and stays in the current shell.
