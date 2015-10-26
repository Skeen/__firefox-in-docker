#!/bin/bash

UID=$(id -u)
GID=$(id -g)

mkdir -p build/
cat Dockerfile.in | sed "s/!!REPLACE_UID!!/$UID/g" | sed "s/!!REPLACE_GID!!/$GID/g" > build/Dockerfile
cd build
docker build --tag=firefox .
