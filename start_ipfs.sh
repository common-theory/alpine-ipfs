#! /bin/bash

set -e

# Detect custom IPFS_PATH configurations
if [[ -z "$IPFS_PATH" ]]; then
  IPFS_PATH="/root/.ipfs"
fi

# Initialize IPFS if path is empty
if [ -z "$(ls -A $IPFS_PATH 2> /dev/null)" ]; then
  ipfs init
fi

# If the CIDS_TO_PIN variable is not supplied let ipfs take over the process
if [ -z $CIDS_TO_PIN ]; then
  echo "received no CIDS_TO_PIN"
  exec ipfs "$@"
fi

# Otherwise spawn a daemon, pin, kill the daemon, start IPFS

# Start an ipfs daemon
ipfs daemon --migrate &

# Store the PID so we can kill it later
DAEMON_PID=$(echo $!)

# Wait for the daemon to initialize
sleep 10

# Pin all the supplied cids
for CID in $CIDS_TO_PIN; do
  echo "pinning $CID"
  ipfs pin add --progress $CID
done

kill $DAEMON_PID

exec ipfs "$@"
