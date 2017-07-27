---
layout: post
title: "Circular Right Rotate"
date: Wed Jul 26 17:58:06 PDT 2017
---

```python
def rotate_right(L, k):
    """
    Circular right rotation of L, k times
    """
    M = L[:]
    for i, _ in enumerate(L):
        M[(i + k) % len(L)] = L[i]
    return M
```
