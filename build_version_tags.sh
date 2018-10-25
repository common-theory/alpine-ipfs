#! /bin/bash

###
# Used to build previous version tags
###

set -e

build_push_version ()
{
  if [ -z $1 ]; then
    echo "build_version requires exactly 1 argument"
    exit 1
  fi
  IPFS_TAG=$1
  IMAGE_TAG="ctheory/alpine-ipfs:$IPFS_TAG"
  docker build -t $IMAGE_TAG --build-arg IPFS_TAG=$IPFS_TAG .
  docker push $IMAGE_TAG
}

# To build versions earlier than v0.4.14 the base image needs
# to be switched to golang:1.10.4-alpine3.8
VERSIONS=("v0.4.6 v0.4.7 v0.4.8 v0.4.9 v0.4.10 v0.4.11 v0.4.12 v0.4.13")

# Build and push each tag
for VERSION in $VERSIONS; do
  build_push_version $VERSION
done
