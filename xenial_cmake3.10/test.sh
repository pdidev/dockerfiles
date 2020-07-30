#!/bin/bash

docker run -t pdidevel/xenial_cmake3.10 /bin/bash -c \
                                            "curl -Lso pdi.tar.gz https://gitlab.maisondelasimulation.fr/pdidev/pdi/-/archive/master/pdi-master.tar.gz && \
                                            tar -xf pdi.tar.gz && \
                                            cd pdi* && \
                                            cmake -DDIST_PROFILE=Devel -DUSE_DEFAULT=EMBEDDED -DUSE_SIONlib=SYSTEM . && \
                                            make -j && \
                                            ctest --output-on-failure"
