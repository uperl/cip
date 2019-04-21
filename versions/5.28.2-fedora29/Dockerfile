FROM plicease/ciperl-base:fedora29
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN  mkdir /tmp/perl-build \
  && cd /tmp/perl-build \
  && curl -O  \
  && tar xvf perl-5.28.2.tar.gz \
  && cd perl-5.28.2 \
  && ./Configure -des -Dprefix=/opt/perl/5.28.2 \
  && make \
  && make install \
  && cd / \
  && rm -rf /tmp/perl-build

RUN curl https://cpanmin.us | /opt/perl/5.28.2/bin/perl - App::cpanminus && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.28.2/bin:/home/cip/bin:/home/cip/.cargo/bin:/usr/local/go/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ADD rc/dzil-cpanm /opt/perl/5.28.2/bin
ADD rc/dzil-dzil  /opt/perl/5.28.2/bin
ADD rc/dzil-af    /opt/perl/5.28.2/bin

RUN chmod +x /opt/perl/5.28.2/bin/dzil-*

