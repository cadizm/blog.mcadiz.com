---
layout: post
title: "Combinatorics refresher"
date: Sat Oct 21 16:22:01 PDT 2017
---

[Power set](https://en.wikipedia.org/wiki/Power_set), [permutations](https://en.wikipedia.org/wiki/Permutation),
and [combinations](https://en.wikipedia.org/wiki/Combination).

Note that for `permutations`, can augment to get the k-length permutations by
return slices of length k (`[v + perm][:k]`).


```python
def powerset(S):
    """
    Return the set of all (2^N) subsets of S (including empty set and S itself)
    """
    res = []

    for i in range(2**len(S)):
        T = []
        for j in range(len(S)):
            if (1 << j) & i:
                T.append(S[j])
        res.append(T)

    return res


def permutations(L):
    """
    Return all n! (n-factorial) permutations of elements in L
    """
    if len(L) <= 0:
        return []
    elif len(L) == 1:
        return L

    res = []
    for i, v in enumerate(L):
        prefix = L[:i]
        suffix = L[i+1:]
        for perm in permutations(prefix + suffix):
            res.append(v + perm)

    return res


def combinations(k, L):
    """
    Return all (binomial coefficient) k-length combinations of elements in L
    """
    if k == 0:
        return [[]]

    res = []
    for i, v in enumerate(L):
        for suffix in combinations(k-1, L[i+1:]):
            res.append([v] + suffix)

    return res
```
