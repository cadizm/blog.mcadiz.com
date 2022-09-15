---
layout: post
title: "SD card dd unbuffered block size write speed"
date: 2014-08-04
---

```shell
l0st:~/workspace/src/minibian/image$ sudo pv -pterb minibian-2013-10-13-fcs.img.copy | sudo dd of=/dev/rdisk1
75.12MiB 0:05:28 [237kiB/s]

l0st:~/workspace/src/minibian/image$ sudo pv -pterb minibian-2013-10-13-fcs.img.copy | sudo dd of=/dev/rdisk1 bs=8m
1.916GiB 0:03:48 [10.7MiB/s]
```

-__-
