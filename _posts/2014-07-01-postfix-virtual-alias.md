---
layout: post
title: "Refresh postfix"
date: Tue Jul  1 18:51:11 PDT 2014
---

From [Postfix README](http://www.postfix.org/VIRTUAL_README.html#virtual_alias)

Execute the command:

```shell
$ postmap /etc/postfix/virtual
```

after changing the virtual file, and execute the command:

```shell
$ postfix reload
```

after changing the main.cf file.
