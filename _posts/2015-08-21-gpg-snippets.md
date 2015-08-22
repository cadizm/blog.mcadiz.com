---
layout: post
title: "GPG snippets"
date: Fri Aug 21 19:05:11 PDT 2015
---

Notes to self re: GPG

If brew installs GPG to `gpg2`, consider symlinking to `gpg`.

#### Generate a key
```
$ gpg --gen-key
```

#### Sign and encrypt
```
$ gpg --armor --sign --encrypt --recipient='foo@bar.com' --output=baz.gpg baz
```

#### Decrypt
```
$ gpg --decrypt baz.gpg
```

#### List/export keys
```
$ gpg --list-keys
$ gpg --armor --output my-public.key --export 'foo@bar.com'
$ gpg --armor --output my-private.key --export-secret-key 'foo@bar.com'
```
