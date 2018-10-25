# alpine-ipfs [![Build Status](https://travis-ci.org/common-theory/alpine-ipfs.svg?branch=master)](https://travis-ci.org/common-theory/alpine-ipfs) [![](https://images.microbadger.com/badges/image/ctheory/alpine-ipfs.svg)](https://hub.docker.com/r/ctheory/alpine-ipfs/ "See docker hub for more information")

An alpine docker image with [go-ipfs](https://github.com/ipfs/go-ipfs) prebuilt.

## Tags

### `latest`

The latest build from the latest release of IPFS.

### `pin`

Built on top of `latest` with an entrypoint script that pins certain CIDS. Useful for spinning up swarms of machines, [documentation here](https://github.com/common-theory/alpine-ipfs/tree/master/pin).

### `vX.X.X`

Specific version tags are available for go-ipfs releases, [full list here](https://hub.docker.com/r/ctheory/alpine-ipfs/tags/).

To build all version tags using travis include `[build versions]` in the commit message.
