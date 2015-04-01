---
layout: post
title: "GTK Emacs Keybindings"
date: Tue Aug 19 14:53:24 PDT 2014
---

Works on Ubuntu 12.04 LTS using Unity/xmonad.

Install `gconf-editor` and launch. This should create `$HOME/.gtkrc-2.0`
which has something like:

    include "/home/me/.gtkrc.mine"

in which you can add:

    gtk-key-theme-name = "Emacs"
