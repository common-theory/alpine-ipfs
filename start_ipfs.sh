#! /bin/sh

set -e

# Detect custom IPFS_PATH configurations
if [ -z "$IPFS_PATH"]; then
  IPFS_PATH="/root/.ipfs"
fi

# Conditionally initialize IPFS
if [ -z "$(ls -A $IPFS_PATH 2> /dev/null)" ]; then
  ipfs init
fi

exec ipfs "$@"
