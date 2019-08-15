FROM plicease/ciperl:5.30
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

ENV PATH /opt/dzil/bin:$PATH
ENV PERL5LIB /opt/dzil/lib/perl5
ENV PERL_LOCAL_LIB_ROOT /opt/dzil
ENV PERL_MB_OPT --install_base /opt/dzil
ENV PERL_MM_OPT INSTALL_BASE=/opt/dzil

RUN cpanm -n Perl::Critic                && rm -rf ~/.cpanm
RUN cpanm -n Perl::Critic::Freenode      && rm -rf ~/.cpanm
RUN cpanm -n YAML                        && rm -rf ~/.cpanm
RUN cpanm -n Test::EOL                   && rm -rf ~/.cpanm
RUN cpanm -n Test::NoTabs                && rm -rf ~/.cpanm
RUN cpanm -n Test::Pod                   && rm -rf ~/.cpanm
RUN cpanm -n Test::Spelling              && rm -rf ~/.cpanm
RUN cpanm -n Test::Version               && rm -rf ~/.cpanm
RUN cpanm -n Test::CPAN::Changes         && rm -rf ~/.cpanm
RUN cpanm -n Test::Fixme                 && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::PPPort && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::AlienBase::Wrapper::Bundle \
                                         && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::Meta::Dynamic::Config \
                                         && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::DynamicPrereqs \
                                         && rm -rf ~/.cpanm

RUN cpanm -n Test::Pod::Spelling::CommonMistakes \
                                         && rm -rf ~/.cpanm

RUN  apt-get update \
  && apt-get install --no-install-recommends \
      aspell \
      aspell-en \
  && apt-get -q autoremove \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists/*

