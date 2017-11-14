---
layout: post
title: "All substrings of a string"
date: Mon Nov 13 17:09:25 PST 2017
---

```python
def substrings(S):
    N = len(S)
    for i in range(N):
        for j in range(i+1, N+1):
            yield S[i:j]

print list(substrings('abc'))
```

```bash
$ python substrings.py
['a', 'ab', 'abc', 'b', 'bc', 'c']
```
