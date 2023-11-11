---
layout: post
title: "_init_completion: command not found"
date: Thu Jul 15 14:57:21 PDT 2021
---

#### Update Sat Nov 11 12:42:24 PST 2023

As of Nov 2023, the easiest way to fix this  is to just install the `bash-completion@2` Homebrew package.

---

If you encounter the [bash](https://www.gnu.org/software/bash/) error message: `_init_completion: command not found` when trying to use bash-completion (and you are on macOS), the error is most likely due to having an older version of bash installed such as 3.2 (which is the default on macOS).

The easiest way to solve this is of course to upgrade using [brew](https://formulae.brew.sh/formula/bash).  At the time of this writing this will install 5.1.8(1)-release, but all we really need is v4.1+ in order to make use of bash-completion v2 which includes `_init_completion`.

Here's a [great article](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-mac/) by the k8s folks that explains the process step-by-step.

But if for some reason we wanted to keep using the default bash shell on macOS along with
bash-completion v1, we could steal a hack found in the `kubctl` completion script:

```bash
# Homebrew on Macs have version 1.3 of bash-completion which doesn't include
# _init_completion. This is a very minimal version of that function.
__kubectl_init_completion()
{
    COMPREPLY=()
    _get_comp_words_by_ref "$@" cur prev words cword
}

# now use this function if we don't have _init_completion installed
if declare -F _init_completion >/dev/null 2>&1; then
    _init_completion -s || return
else
    __kubectl_init_completion -n "=" || return
fi

```
