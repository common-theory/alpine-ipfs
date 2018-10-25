#! /bin/bash

set -e

# Conditionally initialize IPFS
if [ -z "$(ls -A /root/.ipfs > /dev/null)" ]; then
  ipfs init
fi

# Start an ipfs daemon
ipfs daemon &
# Store the PID so we can kill it later
DAEMON_PID=$(echo $!)

if [ -z $CIDS_TO_PIN ]; then
  # echo "received empty CIDS_TO_PIN"
  # CIDS_TO_PIN="/ipfs/Qme7GCRRizTN5G3XJqcFnfmQtjJ7Bh5YDCqM8Zg2nJSnvN"
else
  cids=("$CIDS_TO_PIN")

  # Wait for the daemon to initialize
  sleep 10

  # Pin all the supplied cids
  for cid in $cids; do
    echo "pinning $cid"
    ipfs pin add "$cid" --progress
  done

  echo "finished pinning"
fi

while ps ax | grep -v grep | grep $DAEMON_PID > /dev/null; do
  sleep 30
done

echo "Daemon has stopped running, exiting"

exit 1
