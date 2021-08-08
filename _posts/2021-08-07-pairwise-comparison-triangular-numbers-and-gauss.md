---
layout: post
title: "Pairwise Comparison, Triangular Numbers, and Gauss"
date: Sat Aug  7 16:24:16 PDT 2021
---

When performing [pairwise comparison](https://en.wikipedia.org/wiki/Pairwise_comparison)
over 2 sequences, the canonical code (in Java) looks something like:

```java
public static <T> List<Pair<T>> pairwise(List<T> list) {
    if (list == null) {
        return null;
    }

    int n = list.size();
    List<Pair<T>> res = new ArrayList<>();

    for (int i = 0; i < n - 1; ++i) {
        for (int j = i + 1; j < n; ++j) {
            res.add(new Pair<T>(list.get(i), list.get(j)));
        }
    }

    return res;
}

var input = List.of(a);
var output = [];

var input = List.of(a, b);
var output = [(a, b)];

var input = List.of(a, b, c);
var output = [(a, b), (a, c), (b, c)];

var input = List.of(a, b, c, d);
var output = [(a, b), (a, c), (a, d), (b, c), (b, d), (c, d)];

var input = List.of(a, b, c, d, e);
var output = [(a, b), (a, c), (a, d), (a, e), (b, c), (b, d), (b, e), (c, d), (c, e), (d, e)];
```

When considering the algorithm's [complexity](https://en.wikipedia.org/wiki/Time_complexity)
it's easy to skim the code, see 2 `for` loops, declare it quadratic, and call it a day. But if
we want a more rigorous proof, we can dissect its components.

The outer loop clearly runs in linear time ($$O(n)$$). But what about the inner loops? Each
begins at the $$ith$$ element and ends at the last, so it's upper bound must be $$n$$. But does
that mean the overall pairwise comparison is sub-quadratic?

Again, it becomes easier to see when we start unrolling the loop iterations:

$$
n + (n - 1) + (n - 2) + \cdots + 1
$$

Rewriting from right-to-left in Sigma notation, the formula becomes:

$$
\sum_{k=1}^{n} k = 1 + 2 + 3 + \cdots + n
$$

Which is more easily recognizable as the sequence summing the first $$n$$ integers:

$$
\sum_{k=1}^{n} k = 1 + 2 + 3 + \cdots + n = \frac{n(n + 1)}{2}
$$

The solution to this sequence is most famously attributed to [Gauss](https://en.wikipedia.org/wiki/Carl_Friedrich_Gauss#Anecdotes) when in grade school. And in this notation it's much easier to see that the upper bound is indeed $$O(n^2)$$.

A visual interpretation can be done using [triangular numbers](https://en.wikipedia.org/wiki/Triangular_number), where the triangle can be pictured as a "half-square" of objects added together with
a copy of itself and rotated to form a rectangle with dimensions $$n(n + 1)$$.

Lastly, thinking of this [combinatorically](https://en.wikipedia.org/wiki/Combinatorics), the formula
can be written as a [binomial coefficient](https://en.wikipedia.org/wiki/Binomial_coefficient):

$$
{n + 1 \choose 2} = \frac{n(n + 1)}{2} = \sum_{k=1}^{n} k = 1 + 2 + 3 + \cdots + n
$$
