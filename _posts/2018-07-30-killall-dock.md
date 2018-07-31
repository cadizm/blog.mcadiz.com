---
layout: post
title: "killall Dock"
date: Mon Jul 30 18:27:40 PDT 2018
---

Often, for when unplugging from thunderbolt, the OS X user interface will get
borked and be unable to switch Desktops, launch Launchpad, use Spotlight, etc...

To "fix" the issue I was previously just rebooting my machine. But the other
I learned another much less painful workaround:

```
$ killall Dock
```
