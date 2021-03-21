---
layout: post
title: "Git Rebase Onto"
date: Sun Mar 21 14:46:57 PDT 2021
---

When working on a complicated feature, it is often helpful to break up functionality
into logical and cohesive "working sets" or "change sets". This helps not on the
author, but other engineers during peer code review.

In day-to-day development and when using version control, change sets will almost
always mean [feature branches](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)
in [Git](https://git-scm.com/).

Because complicated features may build upon functionality introduced as part of
the new feature that has not yet been merged back to the main branch, a situation
depicted below can often occur:

```
o---o---o master
     \
      o---o---o  feature-a-part-1
               \
                o---o---o  feature-a-part-2
                         \
                          o---o---o  feature-a-part-3
```

In a perfect world, all 3 feature branches would be bug-free, have the necessary
code review approvals, and be ready to be merged back to the main branch at the
same time in sequential order:

```
(feature-a-part-2) $ git merge feature-a-part-3
(feature-a-part-2) $ git co feature-a-part-1
(feature-a-part-1) $ git merge feature-a-part-2
(feature-a-part-1) $ git co master
(master) $ git merge feature-a-part-1
```

Unfortunately things are much more likely to be a bit messier in real life. Some common
scenarios:

* What happens when parts 1 or 2 have some awkwardness that needs to be reworked?
* Parts 1 and/or 2 are approved and ready to be merged to master, but 3 is not?
* The master branch (or another feature branch) have some changes that make our branch out of date?

The situation can be further complicated when a repository prefers the "[squash-merge](https://docs.github.com/en/github/administering-a-repository/configuring-commit-squashing-for-pull-requests)" strategy since history is
effectively "rolled up" during the squash process, requiring work on the part of the
engineer to make sure branches forked from other feature branches are merged correctly
back to the main branch.

Enter Git [rebase --onto](https://git-scm.com/docs/git-rebase). Taken directly from the
documentation:

> Here is how you would transplant a topic branch based on one branch to another, to pretend that you forked the topic branch from the latter branch, using `rebase --onto`.
> First let’s assume your topic is based on branch next. For example, a feature developed in topic depends on some functionality which is found in next.
```
o---o---o---o---o  master
     \
      o---o---o---o---o  next
                       \
                        o---o---o  topic
```
> We want to make topic forked from branch master; for example, because the functionality on which topic depends was merged into the more stable master branch. We want our tree to look like this:
```
o---o---o---o---o  master
    |            \
    |             o'--o'--o'  topic
     \
      o---o---o---o---o  next
```
> We can get this using the following command:

```
$ git rebase --onto master next topic

```

Using our previous 3-part example above, assume that part 2 has been merged into part 1
and part 1 has been merged into master. We can fix part 3's PR like so:

```
(master) $ git pull
(master) $ git co feature-a-part-3
(feature-a-part-3) $ git rebase -i HEAD~2 --onto master
```

We are replaying the *2* commits made on part 3 after it branched off part 2 onto the new
tip of master.
