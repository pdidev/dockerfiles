FROM pdidevel/xenial_libs_cmake3.10 AS builder

USER 0

COPY pdi_repo /tmp/pdi_repo/data/

RUN cd /tmp/pdi_repo/data/ \
 && sh tools/build_scripts/build_and_run.sh \
 && make install

FROM pdidevel/xenial_libs_cmake3.10

USER 0

COPY --from=builder /usr/local /usr/local

USER 1001
