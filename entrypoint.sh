#! /bin/bash

set -e

ipfs init

# Start an ipfs daemon
ipfs daemon &
# Store the PID so we can kill it later
DAEMON_PID=$(echo $!)

CIDS_TO_PIN="QmfM4BXo4Qwx9CN9oAu8M7VkmrDRrXwj1BAM9WSKNRhaPC"
cids=("$CIDS_TO_PIN")

# Wait for the daemon to initialize
sleep 10

echo "Pinning cids"
# Pin all the supplied cids
for cid in $cids; do
  ipfs pin add "$cid"
done

while ps ax | grep -v grep | grep $DAEMON_PID; do
  sleep 10
  echo "running";
done

echo "Daemon has stopped running, exiting"

exit 1
