---
layout: post
title: "rlwrap ftw"
date: Mon Feb 29 12:37:11 PST 2016
---

[rlwrap](http://utopia.knoware.nl/~hlub/uck/rlwrap/README.txt) is super nifty.
I recently found a need for it when playing around in the [ocaml](https://ocaml.org/)
repl:

```
l00k:~$ ocaml
        OCaml version 4.02.3

# 1 + 2 * 3^A^E^CInterrupted.
# ^D
l00k:~$ rlwrap ocaml
        OCaml version 4.02.3

# 1 + 2 * 3
  ;;
- : int = 7
# ^D
l00k:~$
```
