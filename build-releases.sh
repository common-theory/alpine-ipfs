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

VERSIONS=("v0.4.17 v0.4.16 v0.4.15 v0.4.14")

# Build and push each tag
for version in $VERSIONS; do
  build_push_version $version
done
