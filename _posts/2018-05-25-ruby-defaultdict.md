---
layout: post
title: "Ruby defaultdict"
date: Fri May 25 17:49:43 PDT 2018
---

For those coming from [Python](https://www.python.org/), it may be surprising that
the `new(obj) -> new_hash` [method](https://ruby-doc.org/core/Hash.html#method-c-new)
doesn't behave like Python's [defaultdict](https://docs.python.org/2/library/collections.html#collections.defaultdict).

#### Ruby

```ruby
irb(main):001:0> foo = Hash.new([])
=> {}
irb(main):002:0> foo[:bar].push(1)
=> [1]
irb(main):003:0> foo[:baz].push(2)
=> [1, 2]
irb(main):004:0> foo
=> {}
```

#### Python

```python
In [1]: from collections import defaultdict
In [2]: foo = defaultdict(list)
In [3]: foo['bar'].append(1)
In [4]: foo['baz'].append(2)
In [5]: foo
Out[5]: defaultdict(list, {'bar': [1], 'baz': [2]})
```

Instead what you want is the block form `new {|hash, key| block } -> new_hash`:

```ruby
irb(main):001:0> foo = Hash.new {|h, k| h[k] = []}
=> {}
irb(main):002:0> foo[:bar].push(1)
=> [1]
irb(main):003:0> foo[:baz].push(2)
=> [2]
irb(main):004:0> foo
=> {:bar=>[1], :baz=>[2]}
```
