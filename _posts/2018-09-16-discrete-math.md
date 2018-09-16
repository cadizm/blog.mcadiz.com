---
layout: post
title: "discrete math"
date: Sun Sep 16 16:19:33 PDT 2018
---

Starting a new [GitHub repo](https://github.com/cadizm/discrete-math) with code for theorems, corollaries, and exercises
from [Discrete Mathematics: Elementary and Beyond](https://amzn.to/2xwedvB).

One thing to note is that all of the code will be written in C++ (trying to get up to speed with C++11!!) and is intended
to be run in a [docker](https://www.docker.com/) container. You can find the image [here](https://hub.docker.com/r/cadizm/dev-env/).


The image has all of the necessary dev tools installed (compilers, test libraries, linters, etc) so that you can compile
and run the tests as long as you have docker installed.

See the [README](https://github.com/cadizm/discrete-math/blob/master/README.md) for more info.

First exercise is straightforward decimal to binary conversion:


```C++
std::string dec2bin(int64_t n) {
  if (n < 0) {
    throw std::out_of_range("`n' must be nonnegative");
  } else if (n == 0) {
    return "0";
  }

  std:: string s;

  while (n) {
    auto t = n & 1 ? "1" : "0";
    s.insert(0, t);
    n >>= 1;
  }

  return s;
}
```
