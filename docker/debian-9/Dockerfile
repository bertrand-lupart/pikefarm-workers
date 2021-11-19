FROM debian:9

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
  make gcc g++ m4 libgmp-dev wget curl \
  nettle-dev nettle-bin \
  libmariadbd-dev \
  libpcre2-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupadd --system --gid 999 xenofarm && \
  useradd --system --gid xenofarm --uid 999 xenofarm

USER xenofarm

WORKDIR /pikefarm
