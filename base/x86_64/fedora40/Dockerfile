FROM fedora:40
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

# Note: system perl is not installed by default

RUN yum install -y \
     tcsh \
     nano \
     patch \
     gcc \
     make \
     pkgconf \
     openssl \
     openssl-devel \
     zlib-devel \
     file \
     libffi-devel \
     libarchive-devel \
  && yum clean all

RUN mkdir /work

ENV PLICEASE_DZIL_NO_GIT 1
ENV TZ America/Denver
ENV PERL_CPANM_OPT --no-man-pages

WORKDIR /work

CMD tcsh

RUN groupadd -g 1000 cip
RUN useradd -u 1000 -g 1000 -m -s /bin/tcsh cip
ADD --chown=1000:1000 rc/dot.cshrc /home/cip/.cshrc
