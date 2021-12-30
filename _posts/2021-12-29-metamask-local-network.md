---
layout: post
title: "MetaMask Local Network"
date: Wed Dec 29 20:24:51 PST 2021
---

Have been checking out [Ethereum](https://ethereum.org) during the break, mostly
going through the [docs](https://ethereum.org/en/developers/docs/) as well as
various [guides](https://snakecharmers.ethereum.org/a-developers-guide-to-ethereum-pt-1/)
that I've come across. The impetus was [this](https://edgeandnode.com/blog/defining-the-web3-stack)
article which gives a great intro to the emerging [Web3](https://en.wikipedia.org/wiki/Web3)
movement.

Along with setting up and [interacting](https://geth.ethereum.org/docs/getting-started)
with a local [geth](https://geth.ethereum.org/) node, it's helpful to interact with
[accounts](https://ethereum.org/en/developers/docs/accounts/) (as opposed to
"[wallets](https://ethereum.org/en/wallets/)") using the [MetaMask](https://metamask.io/)
wallet. MetaMask supports importing accounts using private keys or JSON in the
[Web3 Keystore](https://github.com/ethereum/wiki/wiki/Web3-Secret-Storage-Definition)
format.

One thing that wasn't obvious (and also the motivation for this post), was how to setup
MetaMask and a geth node running locally for communication. By default,
[CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) is disabled
and requires a runtime configuration flag to be passed:

```bash
geth --goerli --syncmode "light" --signer=/path/to/signer/clef.ipc --http \
  --http.corsdomain "moz-extension://67b02c56-bb74-4303-bfed-1aa4014483f1"
```

Make sure to set MetaMask ChainID to `5` when using the `--goerli` flag and/or
explicitly set chain ID using the `--networkid` flag (and of course the correct
`chrome` or `moz` extension UUID).
