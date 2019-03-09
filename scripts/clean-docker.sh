#!/bin/sh

echo "This will delete ALL your Docker containers and images. Are you sure? (y/N)"
read INPUT

if [ "${INPUT}" != "y" ]; then
  exit 1
fi

RC=$(docker ps -q)
if [ "${RC}" != "" ]; then
  docker kill ${RC}
fi

PS=$(docker ps -a -q 2>/dev/null)
if [ "${PS}" != "" ]; then
  docker rm ${PS}
fi

IM=$(docker images -a -q 2>/dev/null)
if [ "${IM}" != "" ]; then
  docker rmi ${IM}
fi
