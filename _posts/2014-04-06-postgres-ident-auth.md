---
layout: post
title:  "PostgreSQL Ident Authentication"
date:   Sun Apr  6 13:51:23 PDT 2014
---

*assumes debian/ubuntu-ish linux flavor*

install oidentd

```shell
$ sudo apt-get install oidentd
```

add to `/etc/oidentd.conf`

```conf
 user foo_user {
     default {
         deny spoof
         deny spoof_all
         deny spoof_privport
         allow random
         allow random_numeric
         allow numeric
         deny hide
     }
 }
```

add to `/etc/postgresql/9.1/main/pg_hba.conf`

```conf
 # TYPE   DATABASE   USER   ADDRESS   METHOD
 local    all        all              ident map=my_map
```

add to `/etc/postgresql/9.1/main/pg_ident.conf`

```conf
 # MAPNAME   SYSTEM-USERNAME   PG-USERNAME
 my_map      foo_user          pg_user
```

restart services

```shell
$ sudo service oidentd restart
$ sudo service postgresql restart
```

references

- [postgresql auth methods](http://www.postgresql.org/docs/9.1/static/auth-methods.html)
- [postgresql sample pg_hba.conf](http://www.postgresql.org/docs/9.1/static/auth-pg-hba-conf.html#EXAMPLE-PG-HBA.CONF)
- [postgresql sample pg_ident.conf](http://www.postgresql.org/docs/9.1/static/auth-username-maps.html)
