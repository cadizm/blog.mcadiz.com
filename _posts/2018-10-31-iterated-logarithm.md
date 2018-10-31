---
layout: post
title: "Iterated logarithm"
date: Wed Oct 31 13:51:59 PDT 2018
---

The [iterated logarithm](https://en.wikipedia.org/wiki/Iterated_logarithm)
(written "log\*" and read "log star") is: "the number of times the logarithm
function must be iteratively applied before the result is <= 1".

Among other things, it's useful in analyzing the running time of the `Find`
and `Union` operations in the [union find](https://en.wikipedia.org/wiki/Disjoint-set_data_structure)
datastructure that uses [path compression](https://en.wikipedia.org/wiki/Disjoint-set_data_structure#Path_compression).

Here's a ruby snippet that computes iterated logarithm values for numbers <= 2^65536 (i.e. 2^(2^16)).

```ruby
def log_star(x)
  return 0 if x <= 0

  count = 0
  while x >= 1 do
    x = Math.log2(x)
    count += 1
  end

  count
end

[0, 1, 2, 3, 4, 15, 16, 65535, 65536, 2**65535, 2**65536].map do |i|
  if i <= 65536
    "log* #{i}: #{log_star(i)}"
  else
    "log* 2^#{Math.log2(i).to_i}: #{log_star(i)}"
  end
end
.tap do |res|
  width = res.map(&:size).max
  puts res.map {|x| x.rjust(width)}
end
```

```
$ ruby iterated_logarithm.rb
      log* 0: 0
      log* 1: 1
      log* 2: 2
      log* 3: 2
      log* 4: 3
     log* 15: 3
     log* 16: 4
  log* 65535: 4
  log* 65536: 5
log* 2^65535: 5
log* 2^65536: 6
```
