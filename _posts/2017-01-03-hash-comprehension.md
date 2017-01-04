---
layout: post
title: "Hash comprehension?"
date: Tue Jan  3 17:42:41 PST 2017
---

The closest I've found to a ruby equivalent for python's [dict comprehension](https://docs.python.org/2/tutorial/datastructures.html#dictionaries).

```python
# python

from pprint import pprint
import string

pprint({i: string.lowercase[i] for i in range(len(string.lowercase))})
```

```ruby
# ruby

require 'pp'

lowercase = ('a'..'z').map { |v| v }
pp Hash[lowercase.each_with_index.map { |v, i|  [i, v] }]
```
