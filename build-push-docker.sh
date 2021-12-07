#!/bin/sh

set -x
set -e

bin_docker=$(which docker)
err=$?
if [ ${err} -ne 0]; then
  echo "FATAL: docker binary not found" >&2
  exit ${err}
fi

# Docker hub
user="bertrandlupart"
repo="pikefarm-workers"


# Build Dockerfile and push to Docker hub

build_push()
{
  dir=$1

  if [ ! -d "${dir}" ]; then
    echo "FATAL: ${dir} is not a directory" >&2
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

if [ $# -eq 0 ]; then
  for elem in "docker"/*; do
    echo "building ${elem}"
    build_push "${elem}"
  done
else
  for elem in "$@"; do
    echo "building ${elem}"
    build_push "${elem}"
  done
fi
