FROM plicease/ciperl-base:alpine3.9
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN  mkdir /tmp/perl-build \
  && cd /tmp/perl-build \
  && curl -O https://cpan.metacpan.org/authors/id/S/SH/SHAY/perl-5.30.1.tar.gz \
  && tar xvf perl-5.30.1.tar.gz \
  && cd perl-5.30.1 \
  && ./Configure -des -Dusethreads -Dprefix=/opt/perl/5.30.1 \
  && make \
  && make install \
  && cd / \
  && rm -rf /tmp/perl-build

RUN curl https://cpanmin.us | /opt/perl/5.30.1/bin/perl - App::cpanminus && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.30.1/bin:/home/cip/bin:/home/cip/.cargo/bin:/usr/local/go/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ADD rc/dzil-cpanm   /opt/perl/5.30.1/bin
ADD rc/dzil-dzil    /opt/perl/5.30.1/bin
ADD rc/dzil-af      /opt/perl/5.30.1/bin
ADD rc/dzil-wrapper /opt/perl/5.30.1/bin

RUN chmod +x /opt/perl/5.30.1/bin/dzil-*

ENV CI true
ENV CIPSOMETHING true
ENV CONTINUOUS_INTEGRATION true
ENV CIPDIST alpine3.9
