# alpine-ipfs [![Build Status](https://travis-ci.org/common-theory/alpine-ipfs.svg?branch=master)](https://travis-ci.org/common-theory/alpine-ipfs) [![](https://images.microbadger.com/badges/image/ctheory/alpine-ipfs.svg)](https://hub.docker.com/r/ctheory/alpine-ipfs/ "See docker hub for more information")

An alpine docker image with [go-ipfs](https://github.com/ipfs/go-ipfs) prebuilt.

## Helpful IPFS hashes

### Ethereum Networks

Various testnets are stored on IPFS for quick access without requiring block synchronization. Instead of replaying transactions during synchronization the data is simply downloaded.

Each directory contains a full node synced up to **October 24, 2018**.

Base directory hash: `/ipfs/Qme7GCRRizTN5G3XJqcFnfmQtjJ7Bh5YDCqM8Zg2nJSnvN`

This is also [dnslinked](https://docs.ipfs.io/guides/concepts/dnslink/) to `blockchains.ctheory.io`. This is likely to be more up to date, and should be used with `ipns`.

#### Directory Tree
```sh
blockchains/
└── ethereum
    ├── homestead
    │   ├── geth
    │   │   ├── chaindata
    │   │   ├── ethash
    │   │   └── nodes
    │   └── keystore
    ├── rinkeby
    │   ├── geth
    │   │   ├── chaindata
    │   │   └── nodes
    │   └── keystore
    └── ropsten
        ├── geth
        │   ├── chaindata
        │   ├── ethash
        │   └── nodes
        └── keystore
```

#### Chain Paths

These paths are intended to be used as the `datadir` with `geth`.
- Homestead - `/ipns/blockchains.ctheory.io/ethereum/homestead`
- Ropsten (after constantinople fork) - `/ipns/blockchains.ctheory.io/ethereum/ropsten`
- Rinkeby - `/ipns/blockchains.ctheory.io/ethereum/rinkeby`

These can be used to initialize a node by first downloading the data from IPFS, then running `geth` without a genesis block.

Example:

```sh
# Assuming an IPFS daemon is running, and you've got enough storage space
ipfs get /ipns/blockchains.ctheory.io/ethereum/rinkeby -o ./rinkeby
# Now we've got a data directory that's decently up to date, start syncing
geth --rinkeby --datadir ./rinkeby
```
