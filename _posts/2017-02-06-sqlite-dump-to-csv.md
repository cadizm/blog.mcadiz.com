---
layout: post
title: "sqlite dump to csv"
date: Mon Feb  6 14:05:46 PST 2017
---

Since I always forget...

```bash
$ sqlite3 postal_codes.db
SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for usage hints.
sqlite> .mode csv
sqlite> .output foo.csv
sqlite> .dump postal_codes
sqlite> ^D
```
