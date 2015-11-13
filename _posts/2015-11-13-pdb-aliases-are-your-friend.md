---
layout: post
title: "pdb aliases are your friend"
date: Fri Nov 13 15:17:41 PST 2015
---

Pretty much every time I drop into `ipdb`, I end up inspecting locals to
see what's going on. Very often I assign what I'm inspecting to a local var
`foo` and then either manipulate it and/or write its contents to disk.

It can become annoying to have to keep writing `from pprint import...`. and
as a result I've found these `.pdbrc` aliases really helpful.


```
from pprint import pformat, pprint
_L = locals()
alias pl pprint(_L);
alias dl with open('/tmp/locals.txt', 'w') as f: f.write(pformat(_L))
```
