---
layout: post
title: "Euclid's algorithm"
date: Sat Feb 18 18:29:03 PST 2017
---

Since I always forget


```go
// euclid.go

func gcd(a, b int) int {
	if b == 0 {
		return a
	}
	return gcd(b, a%b)
}

func lcm(a, b int) int {
	return (a * b) / gcd(a, b)
}
```
