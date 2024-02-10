FROM plicease/ciperl-base:jammy
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.38.2 /opt/perl/5.38.2/

RUN curl https://cpanmin.us | /opt/perl/5.38.2/bin/perl - App::cpanminus && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.38.2/bin:/home/cip/bin:/home/cip/.cargo/bin:/usr/local/go/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ADD rc/dzil-cpanm   /opt/perl/5.38.2/bin
ADD rc/dzil-dzil    /opt/perl/5.38.2/bin
ADD rc/dzil-af      /opt/perl/5.38.2/bin
ADD rc/dzil-wrapper /opt/perl/5.38.2/bin

RUN chmod +x /opt/perl/5.38.2/bin/dzil-*

RUN apt-get update                                                                       \
 && apt-get install                                                                      \
      autoconf                                                                           \
      automake                                                                           \
      libtool                                                                            \
      texinfo                                                                            \
 && apt-get -q autoremove                                                                \
 && apt-get -q  clean                                                                    \
 && rm -rf /var/lib/apt/lists/*                                                          \
 && cd /usr/src                                                                          \
 && curl https://codeload.github.com/libffi/libffi/tar.gz/master | tar zxvf -            \
 && cd libffi-master                                                                     \
 && ./autogen.sh                                                                         \
 && ./configure --with-pic --prefix=/opt/libffi --disable-shared && make && make install \
 && cd ..                                                                                \
 && apt-get -q purge autoconf automake libtool texinfo                                   \
 && apt-get -q autoremove                                                                \
 && apt-get -q clean

ENV PKG_CONFIG_PATH /opt/libffi/lib/pkgconfig

ENV CI true
ENV CIPSOMETHING true
ENV CONTINUOUS_INTEGRATION true
ENV CIPDIST jammy
ENV ALIEN_DOWNLOAD_RULE digest_or_encrypt
