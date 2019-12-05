---
layout: post
title: "Python itertools.product and nested loops"
date: Wed Dec  4 18:14:15 PST 2019
---

```python
n = 7
m = 3

# m = 3, so 3 nested loops
foo = []
for i in range(n):
    for j in range(n):
        for k in range(n):
            foo.append((i, j, k))


import itertools
bar = list(itertools.product(*[range(n) for _ in range(m)]))

assert foo == bar
```
