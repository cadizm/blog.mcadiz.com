---
layout: post
title: "ssh disable public key authentication"
date: Fri Jul 11 17:18:43 PDT 2014
---

If you have an ssh-agent running and perhaps alias ssh to `ssh -A`, you
can disable agent forwarding and force password prompting with:

```shell
$ ssh -o 'PubkeyAuthentication=no' foo@127.0.0.1
```

or

```shell
$ SSH_AUTH_SOCK='' ssh foo@127.0.0.1
```

as described [here](http://www.symantec.com/connect/articles/ssh-and-ssh-agent).
