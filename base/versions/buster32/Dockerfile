FROM i386/debian:buster-slim
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

ENV DEBIAN_FRONTEND noninteractive


RUN  echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf.d/00cip  \
  && apt-get update \
  && apt-get install --no-install-recommends \
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
  && apt-get -q autoremove \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /work

ENV PLICEASE_DZIL_NO_GIT 1
ENV TZ America/Denver
ENV PERL_CPANM_OPT --no-man-pages

WORKDIR /work

CMD tcsh

RUN groupadd -g 1000 cip
RUN useradd -u 1000 -g 1000 -m -s /bin/tcsh cip
ADD --chown=1000:1000 rc/dot.cshrc /home/cip/.cshrc
