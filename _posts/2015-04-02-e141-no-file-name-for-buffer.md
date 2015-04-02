---
layout: post
title: "E141: No file name for buffer"
date: Thu Apr  2 14:09:13 PDT 2015
---

If you encounter the vim error messager *E141: No file name for buffer*
and you're not aware of the different buftype's, you can learn more [here](http://vimdoc.sourceforge.net/htmldoc/options.html#'buftype').

But if you don't care and just want this error to go away (SO to the [rescue](http://stackoverflow.com/questions/19241507/in-vim-how-to-get-rid-of-irritating-e141-no-file-name-for-buffer-nn)

    :setlocal buftype=nofile
    :setl bt=nofile
