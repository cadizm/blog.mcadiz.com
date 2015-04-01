---
layout: post
title: "Instagram python api Enforce Signed Header"
date: Sat Feb  7 15:34:28 PST 2015
---

If you have selected _Enforce signed header_ for your Instagram client, you
need to make sure to set the _X-Insta-Forwarded-For_ header as described
in the [developer docs](http://instagram.com/developer/restrict-api-requests/).

I'm using the [python-instagram](https://github.com/Instagram/python-instagram)
library provided by Instagram itself and couldn't figure out how to
set this header. If you know how to do this, please let me know!

The diff below augments `python-instagram`'s `OAuth2API` class and computes and
stuffs the _X-Insta-Forwarded-For_ header arbitrarily on each request. Note that
the value is the client ip address concatenated with an [HMAC](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code)
calculated using SHA256 hash function and the _client secret_ as the key and the
client ip address as the message.


```diff
l0st:~/workspace/src/python-instagram.git (master) $ git df
diff --git a/instagram/oauth2.py b/instagram/oauth2.py
index 56dbd23..7ab0cbd 100644
--- a/instagram/oauth2.py
+++ b/instagram/oauth2.py
@@ -1,3 +1,6 @@
+import hashlib, hmac
+import socket
+
 from .json_import import simplejson
 from six.moves.urllib.parse import urlencode
 from httplib2 import Http
@@ -209,6 +212,14 @@ class OAuth2Request(object):
         headers = headers or {}
         if not 'User-Agent' in headers:
             headers.update({"User-Agent": "%s Python Client" % self.api.api_name})
+        if not 'X-Insta-Forwarded-For' in headers:
+            key = 'put-client-secret-key-here'
+            h = hmac.new(key, digestmod=hashlib.sha256)
+            ipaddr = socket.gethostbyname(socket.gethostname())
+            h.update(ipaddr)
+            v = '{}|{}'.format(ipaddr, h.hexdigest())
+            print v
+            headers.update({"X-Insta-Forwarded-For": v})
         # https://github.com/jcgregorio/httplib2/issues/173
         # bug in httplib2 w/ Python 3 and disable_ssl_certificate_validation=True
         http_obj = Http() if six.PY3 else Http(disable_ssl_certificate_validation=True)
```
