FROM plicease/ciperl-base:latest
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.8.9 /opt/perl/5.8.9/
RUN curl https://cpanmin.us | /opt/perl/5.8.9/bin/perl - App::cpanminus && rm -rf ~/.cpanm

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.24.4 /opt/perl/5.24.4/
RUN curl https://cpanmin.us | /opt/perl/5.24.4/bin/perl - App::cpanminus && rm -rf ~/.cpanm

RUN /opt/perl/5.24.4/bin/cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN /opt/perl/5.24.4/bin/cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN /opt/perl/5.24.4/bin/cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ENV PATH /opt/perl/5.8.9/bin:$PATH

ADD rc/dzil-old-cpanm /opt/perl/5.8.9/bin/dzil-cpanm
ADD rc/dzil-old-dzil  /opt/perl/5.8.9/bin/dzil-dzil
ADD rc/dzil-old-af    /opt/perl/5.8.9/bin/dzil-af
RUN chmod +x /opt/perl/5.8.9/bin/dzil-*
