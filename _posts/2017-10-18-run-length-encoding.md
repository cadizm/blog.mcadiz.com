---
layout: post
title: "Run-length encoding"
date: Wed Oct 18 18:58:31 PDT 2017
---

Given an arbitrary string of fixed length, implement a function that
compresses the string by removing repeated characters and providing a
count of how many are upcoming instead

```python
def rle(S):
    res, count = [], 1

    for i, s in enumerate(S):
        try:
            lookahead = S[i+1]
        except IndexError:
            lookahead = None

        if s == lookahead:
            count += 1
            continue

        if count > 1:
            res.append(str(count))
            count = 1
        res.append(s)

    return ''.join(res)

assert rle('WB') == 'WB'
assert rle('WWB') == '2WB'
assert rle('WWBB') == '2W2B'
assert rle('WWBW') == '2WBW'
assert rle('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW') == '12WB12W3B24WB14W'
```
