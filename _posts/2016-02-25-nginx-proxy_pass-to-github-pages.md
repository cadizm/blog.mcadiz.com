---
layout: post
title: "NGINX proxy_pass to GitHub Pages"
date: Thu Feb 25 11:53:34 PST 2016
---

I have a [digital ocean](https://m.do.co/c/3e0c5934f54e) droplet that I use
for my personal website and also as a playground for side projects.

It's been working out well, but after recently [migrating](http://blog.cadizm.com/2015/04/01/netlifying)
this blog to [netlify](https://www.netlify.com/), I decided to host the [landing
page](http://cadizm.com/) for my site on [GitHub Pages](https://pages.github.com/)
since its content is extremely simple (and static sites are the new hotness).

While GitHub Pages already provides a subdomain (mine is [cadizm.github.io](http://cadizm.github.io/))
I wanted to preserve my sweet domain name.

I'm running NGINX and decided to proxy to GitHub Pages since it seems to do
pretty much what I want to do. One small caveat is that assets need to be
qualified using a full url instead of being specified relatively.

Just in case anyone is trying to do the same, here's a snippet of the relevant
NGINX config:

```
    location / {
        proxy_pass https://cadizm.github.io;
        proxy_set_header Host cadizm.github.io;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
```
