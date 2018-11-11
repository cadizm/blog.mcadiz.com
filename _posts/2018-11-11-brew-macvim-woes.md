---
layout: post
title: "brew macvim woes"
date: Sun Nov 11 15:15:04 PST 2018
---

When you get the lovely library not found errors after installing macos
security updates:

```
$ gvim
$ dyld: Library not loaded: /System/Library/Frameworks/Ruby.framework/Versions/2.0/usr/lib/libruby.2.0.0.dylib
```

After much heartache and googling, here's how you force brew to install macvim
using the ruby version on your PATH:

```
l00k:~$ brew install --env=std macvim --HEAD
Updating Homebrew...
==> Cloning https://github.com/macvim-dev/macvim.git
Cloning into '/Users/mcadiz/Library/Caches/Homebrew/macvim--git'...
==> Checking out branch master
Already on 'master'
Your branch is up to date with 'origin/master'.
==> ./configure --with-features=huge --enable-multibyte --with-macarchs=x86_64 --enable-perlinterp --enable-rubyinterp --enable-tclinterp --enable-terminal --with-tlib=ncurses --w
==> make
🍺  /usr/local/Cellar/macvim/HEAD-2c43cd6: 2,185 files, 37.9MB, built in 1 minute 12 seconds
```
