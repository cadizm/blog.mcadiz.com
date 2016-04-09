---
layout: post
title: "ffmpeg time lapse"
date: Fri Apr  8 17:37:09 PDT 2016
---

Note to self: after some googling and playing around with options, use the
following to create time lapses with `ffmpeg`:

```bash
$ ffmpeg -framerate 30 -i '%*.JPG' -q:v 2 -r 30 -pix_fmt yuv420p timelapse.mp4
```
