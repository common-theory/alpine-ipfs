FROM golang:1.11.1-alpine3.8
MAINTAINER Chance Hudson

# This is set in the CI as well, be sure to update in both places
ARG IPFS_TAG="v0.4.17"

ENV SRC_DIR /go/src/github.com/ipfs/go-ipfs

RUN apk add --no-cache git make bash gcc musl-dev \
  && go get -u github.com/whyrusleeping/gx

# Fixes an issue with symlinked binaries not playing well with musl
# Thanks https://stackoverflow.com/questions/34729748/installed-go-binary-not-found-in-path-on-alpine-linux-docker
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN git clone --branch $IPFS_TAG https://github.com/ipfs/go-ipfs.git $SRC_DIR \
  && cd $SRC_DIR \
  && make build

FROM alpine:3.8

ENV SRC_DIR /go/src/github.com/ipfs/go-ipfs
COPY --from=0 $SRC_DIR/cmd/ipfs/ipfs /usr/local/bin/ipfs

COPY ./start_ipfs.sh /

ENTRYPOINT ["/start_ipfs.sh"]

CMD ["daemon", "--migrate"]
