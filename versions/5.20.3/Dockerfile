FROM plicease/ciperl-base:latest
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.20.3 /opt/perl/5.20.3/
RUN curl https://cpanmin.us | /opt/perl/5.20.3/bin/perl - App::cpanminus
ENV PATH /opt/perl/5.20.3/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla Dist::Zilla::PluginBundle::Author::Plicease
ADD cpanm-wrapper /opt/dzil/bin/cpanm-wrapper
ADD dzil-wrapper /opt/dzil/bin/dzil-wrapper
RUN ln -s /opt/dzil/bin/cpanm-wrapper /opt/perl/5.20.3/bin/dzil-cpanm
RUN ln -s /opt/dzil/bin/dzil-wrapper /opt/perl/5.20.3/bin/dzil
RUN chmod +x /opt/perl/5.20.3/bin/dzil-cpanm /opt/perl/5.20.3/bin/dzil

ENV PERL_USE_UNSAFE_INC 0
