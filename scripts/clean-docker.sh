#!/bin/sh

PS=$(docker ps -a -q 2>/dev/null)
if [ "${PS}" != "" ]; then
  docker rm ${PS}
fi

IM=$(docker images -a -q 2>/dev/null)
if [ "${IM}" != "" ]; then
  docker rmi ${IM}
fi
