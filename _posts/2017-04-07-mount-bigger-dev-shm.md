---
layout: post
title: "mount bigger /dev/shm"
date: Fri Apr  7 13:50:35 PDT 2017
---

While working on a [project](https://github.com/cadizm/instabot) that fires
up a whole bunch of headless Google Chrome tabs using [Selenium Python](http://selenium-python.readthedocs.io/),
I noticed that my program would crash all the time due to a "tab crash" error.

At first I thought it was just a difference between Ubuntu and OS X since it
seemed to work fine on my laptop. But after a little googling I came across
a [docker thread](https://github.com/elgalu/docker-selenium/issues/20) which
seemed to be pretty similar to what I was experiencing.

Apparently the default mount size for `/dev/shm` may not be large enough if
Chrome has alot of tabs open (you check how many using `$ lsof /dev/shm`). To
increase the size:

```bash
$ sudo umount /dev/shm
$ sudo mount -t tmpfs -o rw,nosuid,nodev,noexec,relatime,size=512M tmpfs /dev/shm
```
