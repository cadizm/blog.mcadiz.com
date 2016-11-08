---
layout: post
title: "ImageMagick identify"
date: Mon Nov  7 17:26:31 PST 2016
---

To get the "format and characteristics" of one or more images, [ImageMagick](http://www.imagemagick.org/script/identify.php)
to the rescue:

```bash
$ find . -type f -iname '*.jpg' | xargs identify
```
