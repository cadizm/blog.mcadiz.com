---
layout: post
title: "No more sslwrap"
date: Sat Jul 11 19:13:58 PDT 2015
---

If you find that your version of Python no longer has `sslwrap` and 3rd
party library requires it (i.e. gevent), here's a [post](http://rex-shen.net/an-workaround-for-sslwrap-problem-in-event/)
describing a workaround which worked for me.

It basically boils down to defining and setting the following:


```python
import inspect
__ssl__ = __import__('ssl')

try:
    _ssl = __ssl__._ssl
except AttributeError:
    _ssl = __ssl__._ssl2


def new_sslwrap(sock, server_side=False, keyfile=None, certfile=None, cert_reqs=__ssl__.CERT_NONE, ssl_version=__ssl__.PROTOCOL_SSLv23, ca_certs=None, ciphers=None):
    context = __ssl__.SSLContext(ssl_version)
    context.verify_mode = cert_reqs or __ssl__.CERT_NONE
    if ca_certs:
        context.load_verify_locations(ca_certs)
    if certfile:
        context.load_cert_chain(certfile, keyfile)
    if ciphers:
        context.set_ciphers(ciphers)

    caller_self = inspect.currentframe().f_back.f_locals['self']
    return context._wrap_socket(sock, server_side=server_side, ssl_sock=caller_self)

if not hasattr(_ssl, 'sslwrap'):
    _ssl.sslwrap = new_sslwrap
```
