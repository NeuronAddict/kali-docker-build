FROM debian:stable-slim

RUN apt update && apt install -y apt-cacher-ng

COPY zzz_override.conf /etc/apt-cacher-ng/

RUN echo "Proxy: $UPSTREAM_APT_PROXY" > /etc/apt-cacher-ng/zzz_override_proxy.conf

CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
