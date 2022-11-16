#!/bin/env bash

HOST_USER=$(who | awk '{print $1}')
HOST_UID=$(id -u)
HOST_GID=$(id -g)


podman run --rm  --privileged -p 8888:8888 --name jupyter -e NB_USER=${HOST_USER} -e CHOWN_HOME=yes -e CHOWN_EXTRA_OPTS='-R' --user root -w /home/${HOST_USER}/ -v $(pwd)/jupyter:/home/${HOST_USER}/ jupyter/base-notebook 
