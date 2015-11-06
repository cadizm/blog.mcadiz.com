---
layout: post
title: "moreutils::sponge"
date: Thu Nov  5 19:21:53 PST 2015
---

Just discovered [moreutils](https://joeyh.name/code/moreutils/) after
searching for "cat file sort and write to same file".

StackExchange told me that `sort` actually has an option to pseudo edit
files "in-place" with the `-o, --output` options. But one of the _more
intersting_ (pun intended) google results described `sponge` found in
[moreutils](https://joeyh.name/code/moreutils/).

Where you can do nifty things like:

```bash
$ sort conquest_eligible.txt | sponge conquest_eligible.txt
```
