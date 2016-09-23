---
layout: post
title: "Docker snippets"
date: Thu Sep 22 14:39:43 PDT 2016
---

Notes on using Docker Toolbox (not Docker for Mac, since I want to provision
Docker hosts on remote machines).

```bash
# create a new machine
$ docker-machine create --driver virtualbox shiny-new-machine
$ docker-machine ls
$ eval $(docker-machine env shiny-new-machine)
$ docker-machine ip shiny-new-machine

# run a container
$ docker run -p  8001:80 nginx
$ docker ps
$ curl $(docker-machine ip shiny-new-machine)

# start up a bunch of containers
$ docker-compose -f dev.yml up

# run command in existing container
$ docker exec foo_container python manage.py migrate
```
