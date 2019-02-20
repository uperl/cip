FROM plicease/ciperl-base:stretch
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.28.1 /opt/perl/5.28.1/

RUN curl https://cpanmin.us | /opt/perl/5.28.1/bin/perl - App::cpanminus && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.28.1/bin:/home/cip/bin:/home/cip/.cargo/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ADD rc/dzil-cpanm /opt/perl/5.28.1/bin
ADD rc/dzil-dzil  /opt/perl/5.28.1/bin
ADD rc/dzil-af    /opt/perl/5.28.1/bin

RUN chmod +x /opt/perl/5.28.1/bin/dzil-*

RUN apt-get update                                                                    \
 && apt-get install -y                                                                \
      autoconf                                                                        \
      automake                                                                        \
      libtool                                                                         \
      texinfo                                                                         \
 && apt-get -qy autoremove                                                            \
 && apt-get -qy clean                                                                 \
 && rm -rf /var/lib/apt/lists/*                                                       \
 && cd /usr/src                                                                       \
 && curl https://codeload.github.com/libffi/libffi/tar.gz/master | tar zxvf -         \
 && cd libffi-master                                                                  \
 && ./autogen.sh                                                                      \
 && ./configure --prefix=/opt/libffi --disable-shared && make && make install         \
 && cd .. && rm -rf libffi-master                                                     \
 && apt-get -qy purge autoconf automake libtool texinfo                               \
 && apt-get -qy autoremove                                                            \
 && apt-get -qy clean

ENV PKG_CONFIG_PATH /opt/libffi/lib/pkgconfig

