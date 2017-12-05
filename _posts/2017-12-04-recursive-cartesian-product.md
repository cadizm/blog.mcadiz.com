---
layout: post
title: "Recursive Cartesian Product"
date: Mon Dec  4 18:54:47 PST 2017
---

A recursive approach to [Python](https://docs.python.org/2.7/library/itertools.html#itertools.product)'s
iterative method for the [Cartesian product](https://en.wikipedia.org/wiki/Cartesian_product):


```python
def product(*args):
    res = []
    product_helper([], args, 0, res)
    return res


def product_helper(prefix, pools, offset, res):
    if offset >= len(pools):
        res.append(tuple(prefix))
        return

    pool = pools[offset]

    for i in range(len(pool)):
        product_helper(prefix + [pool[i]], pools, offset + 1, res)


if __name__ == '__main__':
    import itertools
    L = ['abc', 'def']
    assert product(*L) == list(itertools.product(*L))
```
