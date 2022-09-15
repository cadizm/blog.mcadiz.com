---
layout: post
title: "Apache mod_rewrite `serve backup' file"
date: Tue Jun 10 13:41:44 PDT 2014
---

when we can't find a particular static file in its "usual" location, use its alternate.

```apache
RewriteEngine On
RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} !-f
RewriteCond %{REQUEST_URI}  ^/foo/bar/baz(.*\.png)$
RewriteRule ^/foo/bar/baz/(.*)$  /nfs/foo/bar/baz/$1
```
