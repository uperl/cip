FROM debian:jessie-slim
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
       pkg-config \
  && apt-get -qy autoremove \
  && apt-get -qy clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /work

ENV PLICEASE_DZIL_NO_GIT 1
ENV TZ America/Denver

WORKDIR /work

CMD tcsh

RUN groupadd -g 1000 cip
RUN useradd -u 1000 -g 1000 -m -s /bin/tcsh cip
ADD --chown=1000:1000 rc/dot.cshrc /home/cip/.cshrc
