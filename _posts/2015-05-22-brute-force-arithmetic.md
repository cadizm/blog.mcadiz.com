---
layout: post
title: "brute force arithmetic"
date: Fri May 22 12:28:08 PDT 2015
---

Came across [this puzzle](http://www.theguardian.com/science/alexs-adventures-in-numberland/2015/may/20/can-you-do-the-maths-puzzle-for-vietnamese-eight-year-olds-that-has-stumped-parents-and-teachers)
today. Instead of trying to do some fancy multivariate analysis, here's
a brute force solution.

<img src="/images/nam_puzzle.png" class="img-responsive">

```python
"""
Solve the `nam puzzle' using brute force.

See http://goo.gl/8b0ri6 for full problem description.
"""


def main():
    from itertools import permutations
    for p in permutations(range(1, 10)):
        a, b, c, d, e, f, g, h, i = p
        if a + ((13 * b) / c) + d + (12 * e) \
                - f - 11 + ((g * h) / i) - 10 == 66:
            print ':) => {}'.format(p)
            break
    else:
        print ':('


if __name__ == '__main__':
    import sys
    sys.exit(main())
```

```bash
l00k:~/ws/20150522$ python nam_puzzle.py
:) => (1, 2, 3, 4, 6, 5, 7, 9, 8)
```
