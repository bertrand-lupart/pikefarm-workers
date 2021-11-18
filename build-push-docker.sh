#!/bin/sh

set -x
set -e

bin_docker="/usr/local/bin/docker"

# Docker hub
user="bertrandlupart"
repo="pikefarm-worker"


# Build Dockerfile and push to Docker hub

build_push()
{
  dir=$1

  if [ ! -d "${dir}" ]; then
    echo "${dir} is not a directory" >&2
    return
  fi

  . "${dir}/vars"
 
  tag=$(basename "${dir}")

  ${bin_docker} buildx build \
    --tag="${user}/${repo}:${tag}" \
    --platform="${arch}" \
    --push \
    "${dir}"

  return
}


# Either give directory/ies as argument(s), either loop over docker/ directory

if [ $# == 0 ]; then
  for elem in "docker"/*; do
    echo "building ${elem}"
    build_push "${elem}"
  done
else
  for elem in $*; do
    echo "building ${elem}"
    build_push "${elem}"
  done
fi
