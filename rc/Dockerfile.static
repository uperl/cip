FROM plicease/ciperl:5.30
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

ENV PATH /opt/dzil/bin:$PATH
ENV PERL5LIB /opt/dzil/lib/perl5
ENV PERL_LOCAL_LIB_ROOT /opt/dzil
ENV PERL_MB_OPT --install_base /opt/dzil
ENV PERL_MM_OPT INSTALL_BASE=/opt/dzil
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV CIPSTATIC true

RUN  apt-get update \
  && apt-get install --no-install-recommends \
      aspell \
      aspell-en \
      locales \
  && apt-get -q autoremove \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists/*

RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
RUN locale-gen
RUN dpkg-reconfigure locales

RUN cpanm -n Perl::Critic                                      && rm -rf ~/.cpanm
RUN cpanm -n Perl::Critic::Freenode                            && rm -rf ~/.cpanm
RUN cpanm -n YAML                                              && rm -rf ~/.cpanm
RUN cpanm -n Test::EOL                                         && rm -rf ~/.cpanm
RUN cpanm -n Test::NoTabs                                      && rm -rf ~/.cpanm
RUN cpanm -n Test::Pod                                         && rm -rf ~/.cpanm
RUN cpanm -n Test::Spelling                                    && rm -rf ~/.cpanm
RUN cpanm -n Test::Version                                     && rm -rf ~/.cpanm
RUN cpanm -n Test::CPAN::Changes                               && rm -rf ~/.cpanm
RUN cpanm -n Test::Fixme                                       && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::PPPort                       && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::AlienBase::Wrapper::Bundle   && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::Meta::Dynamic::Config        && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::DynamicPrereqs               && rm -rf ~/.cpanm
RUN cpanm -n Test::Pod::Spelling::CommonMistakes               && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::PluginBundle::Author::Plicease       && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::MetaProvides::Package        && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::Bootstrap::lib               && rm -rf ~/.cpanm
RUN cpanm -n Alien::Build::Plugin::Decode::SourceForge         && rm -rf ~/.cpanm
RUN cpanm -n Alien::Build::Plugin::Probe::GnuWin32             && rm -rf ~/.cpanm
RUN cpanm -n Env::ShellWords                                   && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::SetScriptShebang             && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::CommentOut                   && rm -rf ~/.cpanm
RUN cpanm -n Alien::Build::Plugin::Build::Copy                 && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::MathInt64                    && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::FFI::Build                   && rm -rf ~/.cpanm
RUN cpanm -n Dist::Zilla::Plugin::Deprecated                   && rm -rf ~/.cpanm

RUN cpanm -n https://dist.wdlabs.com/Test-Spelling-0.20.tar.gz
RUN cpanm -n https://dist.wdlabs.com/Test2-Tools-PerlCritic-0.01.tar.gz

# don't include Test::Strict, because it requires XS modules to be built
#RUN cpanm -n Test::Strict

RUN perl -npE 's/use warnings;/no warnings;/' /opt/dzil/lib/perl5/Pod/Spell.pm > /opt/dzil/lib/perl5/Pod/Spell.pm.nowarn && mv /opt/dzil/lib/perl5/Pod/Spell.pm.nowarn /opt/dzil/lib/perl5/Pod/Spell.pm
