---
layout: post
title: Markdownify'ing webpages
date: Sat Jun  6 23:17:33 PDT 2015
---

I needed to convert some webpages to a human-readable format for studing/review
at a later time. After some thought I came up with the following:

1. download pages via curl/wget or good old "save page as"
2. [slugify](https://github.com/cadizm/bin/blob/master/slugify) filenames for easier shell manipulation
3. convert to markdown using Aaron Swartz's [html2text](https://github.com/aaronsw/html2text/blob/master/html2text.py)
4. rename file extensions to reflect new format

```bash
# delete directories (handling spaces in filenames)
$ find . -type d -print0 | xargs -0 rm -rf

# slugify, rename, then delete html files
$ ls | xargs -0 | slugify && \
for file in $(ls ); do
    html2text $file > ${file%.html}.md;
done && \
rm *.html
```
