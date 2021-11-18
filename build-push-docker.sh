#!/bin/sh

set -x
set -e

bin_docker="/usr/local/bin/docker"

# Docker hub
user="bertrandlupart"
repo="pikefarm-worker"

for dir in "docker"/*; do
  
  if [ ! -d "${dir}" ]; then
    exit
  fi

  . "${dir}/vars"
 
  tag=$(basename "${dir}")

  ${bin_docker} buildx build --tag="${user}/${repo}:${tag}" --platform="${ARCH}" --push "${dir}"

done
