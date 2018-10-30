---
layout: post
title: "Bash 'Command' Builtin"
date: Tue Oct 30 12:47:21 PDT 2018
---

According to the [manual](https://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html),

```
command -v  <command>
```

...causes a single word indicating the command or file name used to invoke _command_ to be displayed.

Very useful when `which foo` doesn't work (for example [`nvm`](https://github.com/creationix/nvm/issues/540)
which is a sourced function defined during shell creation).
