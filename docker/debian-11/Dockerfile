FROM debian:11

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y make gcc g++ m4 libgmp-dev wget curl \
  nettle-dev nettle-bin \
  libmariadbd-dev \
  libpcre2-dev

RUN groupadd --system --gid 999 xenofarm && \
  useradd --system --gid xenofarm --uid 999 xenofarm

USER xenofarm

WORKDIR /pikefarm
