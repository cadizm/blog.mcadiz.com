---
layout: post
title: "Fibonacci Fun Time"
date: Mon May 30 14:31:25 PDT 2016
---

I signed up for Coursera's [Algorithmic Toolbox](https://www.coursera.org/learn/algorithmic-toolbox)
for fun and to dust the cobwebs on some CS FUNdamentals.

The [first programming assignment](https://github.com/cadizm/algorithmic-toolbox/tree/master/week-02/programming-assignment)
involved a number of different variations on calculating Fibonacci numbers. And
although they provided a more efficient solution than the naive recursive
implementation, I wanted do some googling and see if there were any other faster
implementations.

I came upon [Nayuki's](https://www.nayuki.io/) [fast doubling](https://www.nayuki.io/page/fast-fibonacci-algorithms)
implementation and wanted to do a quick and dirty benchmark against more
common algorithms. Here it is!

```python
## Decorator functions

from functools import wraps

def memoize(func):
    table = {}

    @wraps(func)
    def wrapper(*args):
        if args not in table:
            table[args] = func(*args)

        return table[args]

    return wrapper


def callrange(func):
    @wraps(func)
    def wrapper(n):
        for i in range(n):
            func(i)

        return func(n)

    return wrapper

## Fibonacci functions

def recursive_fibonacci(n):
    if n in (0, 1):
        return n

    return recursive_fibonacci(n - 1) + recursive_fibonacci(n - 2)


@callrange
@memoize
def memoized_fibonacci(n):
    if n in (0, 1):
        return n

    return memoized_fibonacci(n - 1) + memoized_fibonacci(n - 2)


def list_fibonacci(n):
    L = [i for i in range(n + 1)]

    for i in range(2, len(L)):
        L[i] = L[i - 1] + L[i - 2]

    return L[n]


def sum_fibonacci(n):
    if n in (0, 1):
        return n

    i = 2
    j, k = 0, 1

    while i < n + 1:
        j, k = k, j + k
        i += 1

    return k


def fast_doubling_fibonacci(n):
    """
    Fast doubling Fibonacci algorithm

    Copyright (c) 2015 Project Nayuki
    All rights reserved. Contact Nayuki for licensing.
    https://www.nayuki.io/page/fast-fibonacci-algorithms
    """
    def _fib(n):
        if n == 0:
            return (0, 1)
        else:
            a, b = _fib(n // 2)
            c = a * (b * 2 - a)
            d = a * a + b * b
            if n % 2 == 0:
                return (c, d)
            else:
                return (d, c + d)

    return _fib(n)[0]


def test(f):
    solutions = [int(n) for n in open('fibonacci.txt')]

    for i in range(len(solutions)):
        assert f(i) == solutions[i]


def time(f, n):
    import time

    start = time.time()
    f(n)
    end = time.time()

    print "%24s: %12f" % (f.func_name, end - start)  # 1 sec lsb


if __name__ == '__main__':
    F = [
        memoized_fibonacci,
        list_fibonacci,
        sum_fibonacci,
        fast_doubling_fibonacci,
    ]

    for f in F:
        test(f)
        time(f, 10000)
```

```bash
$ python fibonacci.py
      memoized_fibonacci:    22.862408
          list_fibonacci:     0.005365
           sum_fibonacci:     0.002401
 fast_doubling_fibonacci:     0.000047
```
