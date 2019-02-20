FROM alpine:3.9
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN apk add --no-cache \
  shadow \
  tcsh \
  bash \
  nano \
  gcc \
  make \
  pkgconf \
  openssl \
  openssl-dev \
  curl \
  musl-dev \
  zlib-dev

RUN mkdir /work

ENV PLICEASE_DZIL_NO_GIT 1
ENV TZ America/Denver
ENV PERL_CPANM_OPT --no-wget --no-man-pages

WORKDIR /work

CMD tcsh

RUN groupadd -g 1000 cip
RUN useradd -u 1000 -g 1000 -m -s /bin/tcsh cip
ADD --chown=1000:1000 rc/dot.cshrc /home/cip/.cshrc
