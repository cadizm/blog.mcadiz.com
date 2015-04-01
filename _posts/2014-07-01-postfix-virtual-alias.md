---
layout: post
title: "Refresh postfix"
date: Tue Jul  1 18:51:11 PDT 2014
---

From [Postfix README](http://www.postfix.org/VIRTUAL_README.html#virtual_alias)

Execute the command:

{% highlight bash %}
$ postmap /etc/postfix/virtual
{% endhighlight %}

after changing the virtual file, and execute the command:

{% highlight bash %}
$ postfix reload
{% endhighlight %}

after changing the main.cf file.
