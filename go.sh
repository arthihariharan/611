#!/bin/bash

#Build docker container

docker build . --build-arg USER_ID=$(id -u) -t project
docker run --rm -v $(pwd):/home/rtudio/work -p 8787:8787 -it project
