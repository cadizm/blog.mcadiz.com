---
layout: post
title: "Running DynamoDB Locally"
date: Fri Jun 18 09:10:12 PDT 2021
---

I've found it useful to run Dynamo locally during development. It's helpful
during new feature development and experimentation (doesn't matter if you
break things and need to start again from scratch). Other benefits include
being a nice person in a shared environment and also [saving money](https://aws.amazon.com/dynamodb/pricing/)
is always good :)

I've added some [helper scripts](https://github.com/cadizm/dynamodb-scripts)
on [GitHub](https://github.com/cadizm) for easily initializing new tables
and dumping their contents. For Java development, you'll also want something
like the following:

```java
// import java.net.URI;
// import org.springframework.web.util.UriComponentsBuilder;
// import software.amazon.awssdk.services.dynamodb.DynamoDbAsyncClient;

URI uri = UriComponentsBuilder.newInstance()
    .scheme("http")
    .host("localhost")
    .port("8000")
    .build().toUri();

DynamoDbAsyncClient client = DynamoDbAsyncClient.builder()
    .endpointOverride(uri)
    .build();
```
