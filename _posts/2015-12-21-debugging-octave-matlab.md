---
layout: post
title: "Debugging Octave/Matlab"
date: Mon Dec 21 18:16:45 PST 2015
---

Small note to self: favor [keyboard](show_tradein_plans_dialog) over
[dbstop](http://www.mathworks.com/help/matlab/ref/dbstop.html) in Octave
(not sure about Matlab).

During cursory exploration, locals don't seem to be in scope using `dbstop`.
