---
layout: post
title: "xargs with files with spaces"
date: Thu Feb  4 17:52:17 PST 2016
---

Oldie, but goodie that I had to review manpage because I forgot the flag:

```bash
$ find . -type f -iname '*.foo' -print0 | xargs -0 rm -f
```
