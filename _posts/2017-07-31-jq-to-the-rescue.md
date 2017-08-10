---
layout: post
title: "jq to the rescue"
date: Mon Jul 31 16:18:08 PDT 2017
---

If you've ever pulled your hair attempting to parse JSON using `awk`/`grep`/`sed`,
do your hairline a favor and install [jq](https://stedolan.github.io/jq/).

The docs are very good, but to give a non-trivial concrete example, here's
processing JSON output from a Jenkins API:

```bash
function poll_jenkins {
    url="$JENKINS/job/foo/api/json"
    count=0
    while [ $count -lt $WAIT_COUNT ]; do
        let count=count+1
        echo -n "."
        sleep 1
        response=$(curl -q -S -X GET $url 2>/dev/null)
        if [ $(echo $response | jq ".inQueue") = "true" ]; then
            continue
        fi
        last_successful_build=$(echo $response | jq ".lastSuccessfulBuild.number")
        last_build=$(echo $response | jq ".lastBuild.number")
        if [ "$last_successful_build" = "$last_build" ]; then
            LAST_BUILD=$last_build
            return
        fi
    done
}
```

Retrieving the `offer_id` from a list of `offers`:

```bash
$ cat offers-2017-07-31.json | jq '[.offers[].offer_id]' | less
```
