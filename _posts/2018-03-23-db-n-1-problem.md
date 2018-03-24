---
layout: post
title: "Database N+1 Queries"
date: Fri Mar 23 19:11:35 PDT 2018
---

Was recently reminded to always be on the lookout for potential [n+1 query](https://goo.gl/yK3As3)
pitfalls. Take a look at the code before:

```ruby
index = (string.size-1).downto(0).find {|i| Foo::Model.find_by(bar: string[0..i])}
index ? string[0..index] : nil
```

Versus the after:

```ruby
candidates = string.length.times.map {|i| string[0..i]}
Foo::Model.where(bar: candidates).order('length(bar) desc').take&.bar
```

*Much* nicer doing 1 trip to the db with the query selecting and sorting instead
of searching candidates one by one, up to `string.length` times.
