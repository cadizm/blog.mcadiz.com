---
layout: post
title: "Git: cleanup merged branches"
date: Mon Oct 23 12:21:57 PDT 2017
---

Delete local branches already merged to develop.

```bash
$ git br --merged develop | grep -v 'develop|master' | xargs git br -d
```
