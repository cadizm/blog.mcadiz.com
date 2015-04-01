---
layout: post
title: "CPython vs C Performance"
date: Mon Dec 22 14:58:49 PST 2014
---

I've been doing some [HackerRank](https://www.hackerrank.com/) challenges for
fun lately. Their platform has support for pretty much every language under
the sun, so users are free to use what they're most comfortable with.

Python's been my language of choice for the problem sets since they're not too
complicated (at least the warmups) and the solutions typically require only
coding up a quick function or two.

Submissions have [time/memory limitations](https://www.hackerrank.com/environment)
based on language, which obviously makes sense since performance will vary
depending upon language. But I never really gave language much weight and
concentrated on making sure my algorithm had good to decent Big O computational
run time complexity (where good to decent means polynomial times of O(n<sup>2</sup>)
or O(n<sup>3</sup>) or less).

But after spending a bit of time on a [particular problem](https://www.hackerrank.com/challenges/acm-icpc-team)
whose straightforward solution had a cubic running time and consistently went over
HackerRank's 10 second time limit (for python programs), I decided to poke around the
discussion boards and see if I could find out what I was doing wrong and how others
were approaching the problem.

To my surprise one of the moderators commented that another poster's C++ solution
was `correct' and simply required 3 nested loops over the input; pretty much exactly
what I was doing, except in a different language.

I was a bit surprised, and so I translated my python solution to vanilla C and
low and behold run times went from ~16 sec to under 1 sec. I'll now concede that
language choice does in fact matter for `hot' pieces of code or systems requiring
realtime or near-realtime performance. In such cases it probably makes sense to
optimize and/or rewrite critical pieces in a more close-to-the metal language like
assembly, C, or C++.

But of obviously correctness trumps all and gathering data/metrics via profiling and
instrumentation should be done first to see which parts may benefit most from an
optimized rewrite.

For reference the programs and their associated running times are below. And here
is the [problem description](/files/acm-icpc-team-English.pdf) and one of the
sample [inputs](/files/acm_icpc_team.txt).

```bash
$ time cat input/acm_icpc_team.txt | python acm_icpc_team-v1.py
467
1

real    0m16.264s
user    0m16.176s
sys     0m0.045s

$ time cat input/acm_icpc_team.txt | python acm_icpc_team-v2.py
467
1

real    0m16.954s
user    0m16.874s
sys     0m0.045s

$ time cat input/acm_icpc_team.txt | ./acm_icpc_team
467
1

real    0m0.465s
user    0m0.461s
sys     0m0.005s
```

```python
# acm_icpc_team-v1.py

import sys

if __name__ == '__main__':
    line = sys.stdin.readline()
    N, M = [int(n) for n in line.split()]
    buf = [line.strip() for line in sys.stdin]

    max_ = 0
    count = 0

    for i in range(N-1):
        for j in range(i+1, N):
            bits = 0
            for k in range(M):
                if buf[i][k] == '1' or buf[j][k] == '1':
                    bits += 1
            if bits == max_:
                count += 1
            elif bits > max_:
                max_ = bits
                count = 1

    print "{0}\n{1}".format(max_, count)
```

```python
# acm_icpc_team-v2.py

import sys

if __name__ == '__main__':
    line = sys.stdin.readline()
    N, M = [int(n) for n in line.split()]
    buf = [line.strip() for line in sys.stdin]

    max_ = 0
    count = 0

    for i in range(N-1):
        for j in range(i+1, N):
            v = int(buf[i], base=2) | int(buf[j], base=2)
            bits = 0
            while v:
                v &= (v-1)  # clear the least significant bit set
                bits += 1
            if bits == max_:
                count += 1
            elif bits > max_:
                max_ = bits
                count = 1

    print "{0}\n{1}".format(max_, count)
```

```cpp
/* acm_icpc_team.c */

#include <stdio.h>

int main(int argc, char** argv)
{
    int N, M;
    scanf("%d %d\n", &N, &M);

    char buf[500][500];
    for (int i = 0; i < N; ++i) {
        scanf("%500s\n", buf[i]);
    }

    int max = 0;
    int count = 0;

    for (int i = 0; i < N-1; ++i) {
        for (int j = i+1; j < N; ++j) {
            int bits = 0;
            for (int k = 0; k < M; ++k) {
                if (buf[i][k] == '1' || buf[j][k] == '1') {
                    bits += 1;
                }
            }
            if (bits == max) {
                count += 1;
            }
            else if (bits > max) {
                max = bits;
                count = 1;
            }
        }
    }

    printf("%d\n%d\n", max, count);

    return 0;
}
```
