---
layout: post
title: "nvm error: Checksums do not match"
date: Wed Oct  7 15:40:27 PDT 2015
---

If you get a `Checksums do not match` error while trying to do an `nvm install`
on OS X, do a `brew install md5sha1sum`.

`nvm.sh` has the following conditionals in `nvm_checksum` and `sha1` on OS X
doesn't accept the `-q` option.

```bash
nvm_checksum() {
  local NVM_CHECKSUM
  if nvm_has "sha1sum" && ! nvm_is_alias "sha1sum"; then
    NVM_CHECKSUM="$(command sha1sum "$1" | command awk '{print $1}')"
  elif nvm_has "sha1" && ! nvm_is_alias "sha1"; then
    NVM_CHECKSUM="$(command sha1 -q "$1")"
  elif nvm_has "shasum" && ! nvm_is_alias "shasum"; then
    NVM_CHECKSUM="$(shasum "$1" | command awk '{print $1}')"
  else
    echo "Unaliased sha1sum, sha1, or shasum not found." >&2
    return 2
  fi

  if [ "_$NVM_CHECKSUM" = "_$2" ]; then
    return
  elif [ -z "$2" ]; then
    echo 'Checksums empty' #missing in raspberry pi binary
    return
  else
    echo 'Checksums do not match.' >&2
    return 1
  fi
}
```
