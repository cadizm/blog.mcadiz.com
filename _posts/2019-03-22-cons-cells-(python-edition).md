---
layout: post
title: "Cons cells (python edition)"
date: Fri Mar 22 15:47:13 PDT 2019
---

Came across a puzzle asking about implementing [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language))'s
[car and cdr](https://en.wikipedia.org/wiki/CAR_and_CDR) functions in Python. Turned out to be pretty fun and concise:

```python
# cons.py

# `cons`struct cons cell that holds pairs of values/pointers to values
def cons(a, b):
    def pair(f):
        return f(a, b)
    return pair

# return the first half (`c`ontents of `a`ddress `r`egister) of cons cell
def car(f):
    return f(lambda a, b: a)

# return second first half (`c`ontents of `d`ecrement `r`egister) of cons cell
def cdr(f):
    return f(lambda a, b: b)

# return cons cell as a `dotted pair` string
def dotted(cons_cell, s=None):
    s = [] if s is None else s

    for v in ['(', car(cons_cell), ' . ', cdr(cons_cell), ')']:
        if callable(v):
            dotted(v, s)
        else:
            s.append('nil' if v is None else str(v))

    return ''.join(s)

if __name__ == '__main__':
    print(dotted(cons(1, 2)))
    print(dotted(cons(1, cons(2, cons(3, None)))))
    print(dotted(cons(cons(1, 2), cons(3, 4))))
```

```bash
$ python cons.py
(1 . 2)
(1 . (2 . (3 . nil)))
((1 . 2) . (3 . 4))
```
