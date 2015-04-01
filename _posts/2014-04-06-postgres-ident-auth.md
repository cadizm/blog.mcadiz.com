---
layout: post
title:  "PostgreSQL Ident Authentication"
date:   Sun Apr  6 13:51:23 PDT 2014
---

*assumes debian/ubuntu-ish linux flavor*

install oidentd

{% highlight bash %}
$ sudo apt-get install oidentd
{% endhighlight %}

add to `/etc/oidentd.conf`

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

add to `/etc/postgresql/9.1/main/pg_hba.conf`

    # TYPE   DATABASE   USER   ADDRESS   METHOD
    local    all        all              ident map=my_map

add to `/etc/postgresql/9.1/main/pg_ident.conf`

    # MAPNAME   SYSTEM-USERNAME   PG-USERNAME
    my_map      foo_user          pg_user

restart services

{% highlight bash %}
$ sudo service oidentd restart
$ sudo service postgresql restart
{% endhighlight %}

references

- [postgresql auth methods][postgres-auth]
- [postgresql sample pg_hba.conf][postgres-pg-hba]
- [postgresql sample pg_ident.conf][postgres-pg-ident]

[postgres-auth]: http://www.postgresql.org/docs/9.1/static/auth-methods.html
[postgres-pg-hba]: http://www.postgresql.org/docs/9.1/static/auth-pg-hba-conf.html#EXAMPLE-PG-HBA.CONF
[postgres-pg-ident]: http://www.postgresql.org/docs/9.1/static/auth-username-maps.html
