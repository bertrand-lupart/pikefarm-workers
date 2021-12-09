FROM alpine:3.15

RUN apk add --update \
  make gcc g++ m4 libgmpxx wget curl \
  nettle-dev nettle \
  zlib-dev \
  bzip2-dev \
  && rm -rf /var/cache/apk/*

RUN addgroup -S -g 817 xenofarm && \
  adduser -S -G xenofarm -u 817 xenofarm

USER xenofarm

WORKDIR /pikefarm 
