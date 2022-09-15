---
layout: post
title: "git grep with blame"
date: Wed Apr 23 14:47:35 PDT 2014
---

sometimes we want grep and blame

add to `git-blame` on your PATH

```python
#!/usr/bin/env python

import sys
from subprocess import call

if __name__ == '__main__':
    args = sys.argv[1:]
    assert len(sys.argv[1:]) % 2 == 0
    for (file_line, text) in zip(*[iter(args)] * 2):
        f, n = file_line.strip(':').split(':')
        call(['git', 'blame', '-L', '{0},{1}'.format(n, n), '--', f])
```

then

```shell
$ git grep -i 'error loading order details' | xargs git-blame
76d02b9z (Foo User 2014-03-14 21:05:53 1957)    $self->alert("Error loading order details");
76d02b9z (Foo User 2014-03-14 21:05:53 2053)    $self->alert("Error loading order details");
```
