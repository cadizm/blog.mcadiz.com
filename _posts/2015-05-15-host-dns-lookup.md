---
layout: post
title: "host dns lookup"
date: Fri May 15 15:50:48 PDT 2015
---

Why have I not been using this instead of `dig`?

```
l00k:~/workspace/src/blog.mcadiz.com (master) $ host google.com
google.com has address 216.58.216.14
google.com has IPv6 address 2607:f8b0:4007:809::200e
google.com mail is handled by 20 alt1.aspmx.l.google.com.
google.com mail is handled by 10 aspmx.l.google.com.
google.com mail is handled by 30 alt2.aspmx.l.google.com.
google.com mail is handled by 50 alt4.aspmx.l.google.com.
google.com mail is handled by 40 alt3.aspmx.l.google.com.

l00k:~/workspace/src/blog.mcadiz.com (master) $ host mcadiz.com
mcadiz.com has address 192.241.207.230
mcadiz.com mail is handled by 20 mx2.zohomail.com.
mcadiz.com mail is handled by 10 mx.zohomail.com.

```

Though with the verbose flag turned on, it's pretty much `dig`:

```
l00k:~/workspace/src/blog.mcadiz.com (master) $ host -d mcadiz.com
Trying "mcadiz.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 25273
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;mcadiz.com.                    IN      A

;; ANSWER SECTION:
mcadiz.com.             1550    IN      A       192.241.207.230

Received 44 bytes from 10.18.6.11#53 in 24 ms
Trying "mcadiz.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 64794
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0

;; QUESTION SECTION:
;mcadiz.com.                    IN      AAAA

;; AUTHORITY SECTION:
mcadiz.com.             1543    IN      SOA     ns1.digitalocean.com. hostmaster.mcadiz.com. 1427872864 10800 3600 604800 1800

Received 92 bytes from 10.18.6.11#53 in 1 ms
Trying "mcadiz.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 24704
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;mcadiz.com.                    IN      MX

;; ANSWER SECTION:
mcadiz.com.             1551    IN      MX      20 mx2.zohomail.com.
mcadiz.com.             1551    IN      MX      10 mx.zohomail.com.

Received 76 bytes from 10.18.6.11#53 in 1 ms
```
