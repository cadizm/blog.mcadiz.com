---
layout: post
title: "Map lookup time"
date: Fri Aug 11 16:44:06 PDT 2017
---

Very surprised with the benchmark results of the 2 following parity
implementations:

```go
func Uint64(n uint64) int {
	parity := 0
	for i := uint16(0); i < 4; i++ {
		word := uint16(n >> (16 * i))
		parity ^= lookup(word)
	}

	return parity
}

func parity64(n uint64) int {
	var parity uint64 = 0
	for n > 0 {
		parity ^= 1
		n &= (n - 1) // clear lowest set bit trick
	}
	return int(parity)
}

```

I would have expected to `Uint64` to outperform `parity64` since it's "just"
a whole bunch of map lookup and xor's. But after initial benching and digging
in to see where time was spent, apparently map lookups are not really constant
time in practice.

```bash
$ go test -bench .
BenchmarkParity64-8             2000000000               0.04 ns/op
BenchmarkUint64NoSetup-8        2000000000               0.17 ns/op
BenchmarkUint64WithSetup-8      2000000000               0.17 ns/op
PASS
ok      github.com/cadizm/epi/5.1-compute-parity        10.746s
```

For reference, here's a [link](https://github.com/cadizm/epi/tree/master/5.1-compute-parity)
to the source.
