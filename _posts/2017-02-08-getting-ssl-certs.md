---
layout: post
title: "getting ssl certs"
date: Wed Feb  8 13:20:52 PST 2017
---

I've known about

```bash
$ openssl s_client -connect github.com:443 -showcerts > github.com.crt
```

for a while, but was always annoyed about having to wait for the connection to
timeout and close.  Found a cool workaround [here](https://www.feistyduck.com/library/openssl-cookbook/online/ch-testing-with-openssl.html):

```bash
$ echo | openssl s_client -connect github.com:443 2>&1 | sed --quiet '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > github.com.crt
```

Note: the long form `--quiet` option infers `gnu sed`; if you're on os x, you can

```bash
$ brew install --with-default-names gnu-sed
```
