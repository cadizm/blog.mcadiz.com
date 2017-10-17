---
layout: post
title: "Last git branch"
date: Tue Oct 17 13:41:29 PDT 2017
---

Note to self: to avoid mass proliferation of already merged local branches:

```
l00k:~/workspace/src/foo-proj (feature-foo) $ git co develop
l00k:~/workspace/src/foo-proj (develop) $ git br -d @{-1}
Deleted branch feature-foo (was 8169880).
```
