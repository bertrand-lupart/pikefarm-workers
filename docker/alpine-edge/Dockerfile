FROM alpine:edge

RUN apk add --update \
  make gcc g++ m4 libgmpxx wget curl \
  nettle-dev nettle \
  && rm -rf /var/cache/apk/*

RUN addgroup -S -g 998 xenofarm && \
  adduser -S -G xenofarm -u 999 xenofarm

USER xenofarm

WORKDIR /pikefarm 
