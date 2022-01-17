FROM kalilinux/kali-rolling

ARG UPSTREAM_PROXY

RUN export http_proxy=${UPSTREAM_PROXY} \
    && apt-get update \
    && apt-get install -y curl git live-build gettext cdebootstrap fdisk simple-cdd\
    && unset http_proxy

RUN git config --global http.proxy ${UPSTREAM_PROXY} || true # TODO: can mask another error
RUN git clone https://gitlab.com/kalilinux/build-scripts/live-build-config.git /live-build-config

WORKDIR /live-build-config

COPY run.sh /run.sh

RUN echo 'http://apt-cacher-ng:3142/kali.download/kali' > .mirror

ENTRYPOINT ["/run.sh"]
