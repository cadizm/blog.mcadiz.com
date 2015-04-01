---
layout: post
title: "Imaged OS mac address caching"
date: 2014-07-16
---

[udev](http://en.wikipedia.org/wiki/Udev) caches network interface definitions
by mac address. If you are using a cloned image with this (most likely)
defined incorrectly, it's probably safe to just delete
`/etc/udev/rules.d/70-persistent-net.rules`.
