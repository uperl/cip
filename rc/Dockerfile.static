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

RUN cpanm -n Perl::Critic                                      \
             Perl::Critic::Freenode                            \
             YAML                                              \
             Test::EOL                                         \
             Test::NoTabs                                      \
             Test::Pod                                         \
             Test::Spelling                                    \
             Test::Version                                     \
             Test::CPAN::Changes                               \
             Test::Fixme                                       \
             Dist::Zilla::Plugin::PPPort                       \
             Dist::Zilla::Plugin::AlienBase::Wrapper::Bundle   \
             Dist::Zilla::Plugin::Meta::Dynamic::Config        \
             Dist::Zilla::Plugin::DynamicPrereqs               \
             Test::Pod::Spelling::CommonMistakes               \
             Dist::Zilla::PluginBundle::Author::Plicease       \
             Dist::Zilla::Plugin::MetaProvides::Package        \
             Dist::Zilla::Plugin::Bootstrap::lib               \
             Alien::Build::Plugin::Decode::SourceForge         \
             Alien::Build::Plugin::Probe::GnuWin32             \
             Env::ShellWords                                   \
             Dist::Zilla::Plugin::SetScriptShebang             \
             Dist::Zilla::Plugin::CommentOut                   \
             Alien::Build::Plugin::Build::Copy                 \
             Dist::Zilla::Plugin::MathInt64                    \
             Dist::Zilla::Plugin::FFI::Build                   \
             Dist::Zilla::Plugin::Deprecated                   \
             Test2::Tools::PerlCritic                          \
             ExtUtils::CppGuess                                \
             Dist::Zilla::Plugin::Alt                          \
             https://dist.wdlabs.com/Test-Spelling-0.20.tar.gz && rm -rf ~/.cpanm

# don't include Test::Strict, because it requires XS modules to be built
#RUN cpanm -n Test::Strict

RUN perl -npE 's/use warnings;/no warnings;/' /opt/dzil/lib/perl5/Pod/Spell.pm > /opt/dzil/lib/perl5/Pod/Spell.pm.nowarn && mv /opt/dzil/lib/perl5/Pod/Spell.pm.nowarn /opt/dzil/lib/perl5/Pod/Spell.pm
