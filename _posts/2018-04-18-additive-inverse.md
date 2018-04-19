---
layout: post
title: "Additive Inverse"
date: Wed Apr 18 19:16:42 PDT 2018
---

Obtaining the [additive inverse](https://en.wikipedia.org/wiki/Additive_inverse)
of a [two's complement](https://en.wikipedia.org/wiki/Two%27s_complement)
integer using bitwise negation and addition:

```
In [1]: x = 2
In [2]: ~x + 1
Out[2]: -2
In [3]: x = -77
In [4]: ~x + 1
Out[4]: 77
```
