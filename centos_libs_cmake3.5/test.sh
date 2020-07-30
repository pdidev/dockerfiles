#!/bin/bash

docker run -t pdidevel/centos_libs_cmake3.5 /bin/bash -c
                                            "curl -Lso pdi.tar.gz https://gitlab.maisondelasimulation.fr/pdidev/pdi/-/archive/master/pdi-master.tar.gz && \
                                            tar -xf pdi.tar.gz && \
                                            cd pdi* && \
                                            cmake -DDIST_PROFILE=Devel -DUSE_DEFAULT=SYSTEM -DBUILD_DOCUMENTATION=OFF -DBUILD_TESTING=OFF . && \
                                            make"
