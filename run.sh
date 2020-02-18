#!/bin/bash
docker run \
    --name=homebridge \
    --net=host \
    -d --restart=always \
    -v `pwd`/config:/config \
    homebridge:0.1
