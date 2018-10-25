# alpine-ipfs [![Build Status](https://travis-ci.org/common-theory/alpine-ipfs.svg?branch=master)](https://travis-ci.org/common-theory/alpine-ipfs) [![](https://images.microbadger.com/badges/image/ctheory/alpine-ipfs.svg)](https://hub.docker.com/r/ctheory/alpine-ipfs/ "See docker hub for more information")

An alpine docker image with ipfs prebuilt.

## Helpful IPFS hashes

### Ethereum Networks

Various testnets are stored on IPFS for quick access without requiring block synchronization. Instead of replaying transactions during synchronization the data is simply downloaded.

Each directory contains a full node synced up to **October 24, 2018**.

## TODO: Update this address
Base directory hash: `/ipfs/QmdTFYrd5fYiTwnMaP5CeWmJq7EgoDTTfXxJsdnJPJpsy`

This is also [dnslinked](https://docs.ipfs.io/guides/concepts/dnslink/) to `blockchains.ctheory.io`. This is likely to be more up to date, and should be used with `ipns`.

Tree output:
```
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

Testnet Addresses:

- Rinkeby - `/ipns/blockchains.ctheory.io/ethereum/rinkeby`
- Ropsten (after constantinople fork) - `/ipns/blockchains.ctheory.io/ethereum/ropsten`
- Mainnet - `/ipns/blockchains.ctheory.io/ethereum/homestead`

These can be used to initialize a node by first downloading the data from IPFS, then running geth without a genesis block.

Example:

```sh
# Assuming an IPFS daemon is running, and you've got enough storage space
ipfs get /ipns/blockchains.ctheory.io/ethereum/rinkeby -o ./rinkeby
# Now we've got a data directory that's decently up to date, start syncing
geth --rinkeby --datadir ./rinkeby
```
