FROM plicease/ciperl-base:bookworm
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.30.3 /opt/perl/5.30.3/
RUN curl https://cpanmin.us | /opt/perl/5.30.3/bin/perl - App::cpanminus && rm -rf ~/.cpanm
RUN /opt/perl/5.30.3/bin/cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN /opt/perl/5.30.3/bin/cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN /opt/perl/5.30.3/bin/cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.14.4 /opt/perl/5.14.4/

RUN curl https://cpanmin.us | /opt/perl/5.14.4/bin/perl - App::cpanminus && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.14.4/bin:/home/cip/bin:/home/cip/.cargo/bin:/usr/local/go/bin:$PATH

ADD rc/dzil-old-cpanm   /opt/perl/5.14.4/bin/dzil-cpanm
ADD rc/dzil-old-dzil    /opt/perl/5.14.4/bin/dzil-dzil
ADD rc/dzil-old-af      /opt/perl/5.14.4/bin/dzil-af
ADD rc/dzil-old-wrapper /opt/perl/5.14.4/bin/dzil-wrapper

RUN chmod +x /opt/perl/5.14.4/bin/dzil-*

ENV CI true
ENV CIPSOMETHING true
ENV CONTINUOUS_INTEGRATION true
ENV CIPDIST bookworm
ENV ALIEN_DOWNLOAD_RULE digest_or_encrypt
