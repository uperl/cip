FROM debian:stretch-slim
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
       nano \
       tcsh \
       bzip2 \
       ca-certificates \
       curl \
       dpkg-dev \
       gcc \
       libssl-dev \
       libc6-dev \
       make \
       netbase \
       patch \
       xz-utils \
       zlib1g-dev \
  && apt-get -qy autoremove \
  && apt-get -qy clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /work

ENV PLICEASE_DZIL_NO_GIT 1

WORKDIR /work

CMD tcsh
