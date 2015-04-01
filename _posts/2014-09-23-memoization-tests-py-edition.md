---
layout: post
title: "Memoization tests (py edition)"
date: Tue Sep 23 18:28:05 PDT 2014
---

Script execution and abbreviated source below. Full source can be found
[here](https://github.com/cadizm/memopy).

Note the huge gain after memoization, and that hand-rolled versions still offer
small gains over a decorated version.


```bash
$ python factorial.py

Running Factorial
Testing correctness...
Success
Timing...
0.240013837814
Success

Running RecursiveFactorial
Testing correctness...
RuntimeError('maximum recursion depth exceeded in cmp',) at iteration 998
Timing...
RuntimeError('maximum recursion depth exceeded in cmp',) iteration 994
RuntimeError('maximum recursion depth exceeded in cmp',) iteration 994
0.569229125977
RuntimeError('maximum recursion depth exceeded in cmp',) at iteration 998

Running MemoizedRecursiveFactorial
Testing correctness...
Success
Timing...
0.000745058059692
Success

Running IterativeFactorial
Testing correctness...
Success
Timing...
0.307121992111
Success

Running MemoizedIterativeFactorial
Testing correctness...
Success
Timing...
0.000705003738403
Success

Timing <function time_test_decorated_recursive_factorial at 0x1004a4c08>
0.00292491912842
```

```python
#
# Abridged source
#

class memoize(object):
    """Memoization decorator (@memoize).
    """

    def __init__(self, func):
        self.func = func
        self.memo = dict()

    def __call__(self, *args):
        try:
            return self.memo[args]
        except KeyError:
            self.memo[args] = self.func(*args)
            return self.memo[args]


@memoize
def decorated_recursive_factorial(n):
    if n < 0:
        return None
    if n in [0, 1]:
        return 1
    return n * decorated_recursive_factorial(n - 1)


class MemoizedRecursiveFactorial(Factorial):
    """Memoized recursive factorial implementation.
    """

    def __str__(self):
        return "MemoizedRecursiveFactorial"

    def factorial(self, n):
        if n < 0:
            return None
        if n in self.D:
            return self.D[n]
        if n in [0, 1]:
            return 1
        self.D[n] = n * self.factorial(n - 1)
        return self.D[n]


class MemoizedIterativeFactorial(Factorial):
    """Memoized iterative factorial implementation.
    """

    def __str__(self):
        return "MemoizedIterativeFactorial"

    def factorial(self, n):
        if n < 0:
            return None
        if n in self.D:
            return self.D[n]
        m, res = n, 1
        while m > 1:
            if (m - 1) in self.D:
                self.D[m] = self.D[m - 1] * m
                return self.D[m]
            else:
                res *= m
                self.D[m] = res
                m -= 1
        return res


if __name__ == '__main__':
    f = Factorial()
    r = RecursiveFactorial()
    mr = MemoizedRecursiveFactorial()
    i = IterativeFactorial()
    mi = MemoizedIterativeFactorial()

    for instance in [f, r, mr, i, mi]:
        print '\nRunning {0}'.format(instance)

        print 'Testing correctness...'
        if instance.test_correctness():
            print 'Success'

        print 'Timing...'
        print instance.time_test_factorial()

    print '\nTiming {0}'.format(repr(time_test_decorated_recursive_factorial))
    print time_test_decorated_recursive_factorial()
```
