---
layout: post
title: "screen in screen in screen..."
date: Fri Jan 22 12:16:15 PST 2016
---

Recently ran into an issue where I was running a `screen` session in an
existing `screen`.

My usual workflow is to start a new screen session each day using a custom
[screen startup script](https://github.com/cadizm/bin/blob/master/screen-start)
(since I have [some env vars](https://github.com/cadizm/dotfiles/blob/master/aliases#L27-L28)
 I'd like to renew each day).

I had to then ssh into a remote machine and run a daemonized job in screen
that wrote some output I needed to revisit.

The problem arose in that when I tried to detach from the inner screen, I ended
detaching from the original screen I had started on my local machine. After
some quick googling, I found [this](http://stackoverflow.com/questions/12153996/how-to-detach-an-inner-screen-session).

Since the inner screen was started on a remote machine that didn't have my
[.screenrc](https://github.com/cadizm/dotfiles/blob/master/screenrc#L5), the
global escape option was still the default `ctrl-a`, and I didn't need to go
through the usual hoops when detaching from the inner screen.

Reference for myself:

```
local$ screen-start  # start screen session
local$ screen -x  # attach to screen
local$ ssh remote  # in orig screen
remote$ screen -dmS 'foo.sh' foo.sh  # start/attach new daemonized screen
remote$ ^ad  # detach from inner screen
remote$ ^d  # logout from remote machine
local$  # back to local machine in orig screen
```

Can also do:

```
$ screen -d -D
```
