---
layout: post
title: "ssh force IdentityFile"
date: Wed Oct  8 20:29:38 PDT 2014
---

If you're like me and you work with alot of machines or frequently spin up
and teardown vagrant boxes, then your ssh config file (e.g. `$HOME/.ssh/config`)
is littered with entries like:

    Host 192.168.1.*
      IdentitiesOnly yes
      IdentityFile ~/.ssh/id_rsa-foo

    Host 10.10.10.*
      User baz
      IdentitiesOnly yes
      IdentityFile ~/.ssh/id_rsa.bar

When the machine you'd like to ssh into falls within one of the config ip
ranges, but you'd like to override the rsa key used:

```bash
$ ssh -vvv -o PubkeyAuthentication=no -o IdentitiesOnly=yes -o IdentityFile=~/.ssh/id_rsa.private foo@127.0.0.1
```
