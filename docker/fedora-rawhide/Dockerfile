FROM fedora:rawhide

RUN yum update -y \
  && yum install -y \
  findutils \
  make gcc g++ m4 gmp-devel wget curl \
  nettle-devel \
  mariadb-devel \
  pcre2-devel \
  && yum clean all

RUN groupadd --system --gid 817 xenofarm && \
  useradd --system --gid xenofarm --uid 817 xenofarm

USER xenofarm

WORKDIR /pikefarm
