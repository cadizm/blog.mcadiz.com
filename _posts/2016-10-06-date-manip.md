---
layout: post
title: "date manip"
date: Thu Oct  6 14:17:08 PDT 2016
---

A couple of commands that might be useful for date manipulation:

**Change filename's modification date to today at 6 am**

```bash
$ touch -d "`date "+%D"` 06:00:00" filename
```

If you install [faketime](https://github.com/wolfcw/libfaketime),

**Run script as if it were 10 am now**

```bash
$ faketime "`date "+%D"` 10:00:00" script
```
