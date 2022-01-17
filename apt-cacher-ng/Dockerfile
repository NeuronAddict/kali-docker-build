FROM debian:stable-slim

ARG UPSTREAM_PROXY

RUN export http_proxy=$UPSTREAM_PROXY \
    && apt update \
    && apt install -y apt-cacher-ng \
    && unset http_proxy

COPY zzz_override.conf /etc/apt-cacher-ng/

RUN echo "Proxy: $UPSTREAM_PROXY" > /etc/apt-cacher-ng/zzz_override_proxy.conf

CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
