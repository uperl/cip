FROM plicease/ciperl-base:stretch
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.26.3 /opt/perl/5.26.3/

RUN curl https://cpanmin.us | /opt/perl/5.26.3/bin/perl - App::cpanminus && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.26.3/bin:/home/cip/bin:/home/cip/.cargo/bin:/usr/local/go/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ADD rc/dzil-cpanm /opt/perl/5.26.3/bin
ADD rc/dzil-dzil  /opt/perl/5.26.3/bin
ADD rc/dzil-af    /opt/perl/5.26.3/bin

RUN chmod +x /opt/perl/5.26.3/bin/dzil-*

ENV CI true
ENV CIPSOMETHING true
ENV CONTINUOUS_INTEGRATION true
EMV CIPDIST stretch
