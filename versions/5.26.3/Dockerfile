FROM plicease/ciperl-base:latest
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.26.3 /opt/perl/5.26.3/
RUN curl https://cpanmin.us | /opt/perl/5.26.3/bin/perl - App::cpanminus && rm -rf ~/.cpanm
ENV PATH /opt/perl/5.26.3/bin:$PATH

RUN cpanm -n -L /opt/dzil Dist::Zilla Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
ADD rc/cpanm-wrapper /opt/dzil/bin/cpanm-wrapper
ADD rc/dzil-wrapper /opt/dzil/bin/dzil-wrapper
RUN ln -s /opt/dzil/bin/cpanm-wrapper /opt/perl/5.26.3/bin/dzil-cpanm
RUN ln -s /opt/dzil/bin/dzil-wrapper /opt/perl/5.26.3/bin/dzil
RUN chmod +x /opt/perl/5.26.3/bin/dzil-cpanm /opt/perl/5.26.3/bin/dzil

ENV PERL_USE_UNSAFE_INC 0

#PATH="/opt/dzil/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/opt/dzil/lib/perl5"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/opt/dzil"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/opt/dzil\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/opt/dzil"; export PERL_MM_OPT;

