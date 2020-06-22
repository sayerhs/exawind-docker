FROM exawind/exw-tioga AS tioga
FROM exawind/exw-openfast AS openfast
FROM exawind/exw-trilinos AS trilinos
FROM exawind/nalu-wind AS nalu
FROM exawind/amr-wind AS amr
FROM exawind/wind-utils as wutils
FROM exawind/exw-osrun AS runner

COPY --from=nalu /usr/local /usr/local
COPY --from=tioga /opt/exawind /opt/exawind
COPY --from=openfast /opt/exawind /opt/exawind
COPY --from=trilinos /opt/exawind /opt/exawind
COPY --from=nalu /opt/exawind /opt/exawind
COPY --from=amr /opt/exawind /opt/exawind
COPY --from=wutils /opt/exawind /opt/exawind

RUN (\
    echo "/opt/exawind/lib" > /etc/ld.so.conf.d/exawind.conf \
    && ldconfig \
    )

ENV PATH /opt/exawind/bin:${PATH}
WORKDIR /run
