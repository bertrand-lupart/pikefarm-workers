#!/bin/sh

set -x
set -e

BIN_DOCKER="/usr/local/bin/docker"

# Docker hub
USER="bertrandlupart"
REPO="pikefarm-worker"
PATH="${USER}/${REPO}"


for d in "docker"/*; do
  
  if [ ! -d ${d} ]; 
  then
    exit
  fi

  . ${d}/vars
 
  target=`/usr/bin/basename ${d}`

  ${BIN_DOCKER} buildx build -t ${PATH}:${target} --platform=${ARCH} --push ${d}

done
