---
layout: post
title: "Git flow bullets/checklist"
date: Mon Jun  8 14:02:19 PDT 2015
---

We use [Git flow](http://nvie.com/posts/a-successful-git-branching-model/)
at [work](https://www.truecar.com). While the branching strategy makes
alot of sense and is easy to follow, it can be easy to forget some steps
when executing branch tasks.

Here's sort of a bulleted checklist I use to make sure for the most part
I'm adhering to the spirit of the model. It's derived mostly from an
[Atlassian post](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
describing the workflow.

### Git flow branches

#### master

* `master` stores official release history
* tag each commit on `master` with version/release number
* `hotfix` branches cut from master

#### develop
* `develop` used to integrate feature branches
* `feature` branches branch from `develop`
* `feature` branches merged back into `develop`

#### release branches
* `release/xxx` branches branch from `develop`
* only release-related tasks (bug fixes, documentation) allowed into release
  branch after it is cut
* once `release` branch is ready, it is merged into master (which is then
  tagged with version/release number)
* `release` branch also merged back into develop

#### hotfix branches
* only `hotfix/xxx` branches may branch from `master`
* once hotfix complete, merge branch into both `master` and `develop`
* `master` once again tagged (since each commit to master is tagged)
