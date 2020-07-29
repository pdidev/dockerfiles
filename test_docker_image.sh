#!/bin/bash

docker_image=$1
install_cmd="$2 install -y"

docker run -u 0 -t $docker_image /bin/bash -c "$install_cmd curl sudo;
                                               sudo -u default curl -Lso pdi.tar.gz https://gitlab.maisondelasimulation.fr/pdidev/pdi/-/archive/master/pdi-master.tar.gz && \
                                               tar -xf pdi.tar.gz && \
                                               cd pdi* && \
                                               cmake -DDIST_PROFILE=Devel . && \
                                               make && \
                                               ctest --output-on-failure"
