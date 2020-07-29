#!/bin/bash

# args: $1 docker image tag (e.g. centos_cmake3.5)
#       $2 packaging tool (e.g. yum)
#       $3 "true" if script should call ctest (must be false for cmake < 3.10)

docker_image=$1
install_cmd="$2 install -y"
if ["$3" == "true"];then
    run_ctest="ctest --output-on-failure"
else
    run_ctest="true"
fi

docker run -u 0 -t $docker_image /bin/bash -c "$install_cmd curl sudo;
                                               sudo -u default curl -Lso pdi.tar.gz https://gitlab.maisondelasimulation.fr/pdidev/pdi/-/archive/master/pdi-master.tar.gz && \
                                               tar -xf pdi.tar.gz && \
                                               cd pdi* && \
                                               cmake -DDIST_PROFILE=Devel . && \
                                               make && \
                                               $run_ctest"
