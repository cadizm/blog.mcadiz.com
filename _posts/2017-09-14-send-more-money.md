---
layout: post
title: "Send More Money"
date: Thu Sep 14 16:21:05 PDT 2017
---

How can we get `MONEY`?

```
  SEND
+ MORE
------
 MONEY
```

When in doubt, use brute force:

```python
from itertools import permutations

corpus = list(set('SENDMOREMONEY'))

def f(D):
    def g(word):
        return int(''.join(([str(D[c]) for c in word])))
    return g('SEND') + g('MORE') == g('MONEY')


def pretty_print(D):
    print """
  SEND    {S}{E}{N}{D}
+ MORE  + {M}{O}{R}{E}
------  ------
 MONEY   {M}{O}{N}{E}{Y}
""".format(**D)


for perm in permutations(xrange(0, 10), len(corpus)):
    if f(dict(zip(corpus, perm))):
        pretty_print(dict(zip(corpus, perm)))
```
