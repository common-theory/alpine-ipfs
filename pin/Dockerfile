FROM ctheory/alpine-ipfs:latest
MAINTAINER Chance Hudson

RUN apk add --no-cache bash

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
