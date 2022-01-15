FROM kalilinux/kali-rolling

ARG UPSTREAM_APT_PROXY

RUN apt-get update
RUN http_proxy=${UPSTREAM_APT_PROXY} apt-get install -y curl git live-build gettext cdebootstrap fdisk simple-cdd
RUN git clone https://gitlab.com/kalilinux/build-scripts/live-build-config.git /live-build-config

WORKDIR /live-build-config

COPY run.sh /run.sh

RUN echo 'http://apt-cacher-ng:3142/kali.download/kali' > .mirror

ENTRYPOINT []
