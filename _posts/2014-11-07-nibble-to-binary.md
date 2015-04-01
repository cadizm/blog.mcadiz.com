---
layout: post
title: "Nibble to binary string"
date: Fri Nov  7 15:11:00 PST 2014
---

I needed to demonstrate converting decimal [nibbles](http://en.wikipedia.org/wiki/Nibble)
to binary and used this:

```python
for i in range(0, 16):
    binary = '{:04d}'.format(int(bin(i)[2:]))
```

In retrospect, I probably should have taken the time to write a function:

```python
def binary(nibble):
    "Return 0-padded binary string of nibble"
    if nibble < 0 or nibble > 15:
        raise Exception('Invalid input: {0}'.format(nibble))
    bits = []
    for _ in range(4):
        bits.insert(0, str(nibble & 0x1))
        nibble >>= 1
    return ''.join(bits)
```
