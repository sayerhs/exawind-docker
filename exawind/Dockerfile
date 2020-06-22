FROM exawind/exw-dev-deps AS base
FROM exawind/wind-utils as wutils
FROM exawind/nalu-wind AS nalu
FROM exawind/amr-wind AS amr
FROM exawind/exw-osrun AS runner

COPY --from=base /usr/local /usr/local
COPY --from=wutils /opt/exawind /opt/exawind
COPY --from=nalu /opt/exawind /opt/exawind
COPY --from=amr /opt/exawind /opt/exawind

RUN (\
    echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )

ENV OMPI_MCA_btl_vader_single_copy_mechanism none
ENV PATH /opt/exawind/bin:${PATH}
WORKDIR /workspace
