#!/bin/bash

docker run -u 0 -t pdidevel/centos_cmake3.5 /bin/bash -c "yum install -y curl sudo;
                                            /bin/sudo -u default /bin/bash -c \"curl -Lso pdi.tar.gz https://gitlab.maisondelasimulation.fr/pdidev/pdi/-/archive/master/pdi-master.tar.gz && \
                                            tar -xf pdi.tar.gz && \
                                            cd pdi* && \
                                            cmake -DDIST_PROFILE=Devel -DUSE_DEFAULT=EMBEDDED -DBUILD_DOCUMENTATION=OFF -DBUILD_TESTING=OFF . && \
                                            make\""
