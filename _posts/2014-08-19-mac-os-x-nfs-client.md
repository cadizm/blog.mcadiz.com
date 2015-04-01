---
layout: post
title: "Mac OS X NFS Client"
date: Tue Aug 19 15:04:48 PDT 2014
---

Show what's mounted on `192.168.1.100` and mount on `/nfs/foo`

{% highlight bash %}
$ showmount -e 192.168.1.100
Exports list on 192.168.1.100:
/export/nfs                         192.168.1.101
$ sudo mount -t nfs 10.10.11.62:/export/nfs /nfs/foo
{% endhighlight %}
