FROM plicease/ciperl-base:bullseye
LABEL maintainer="Graham Ollis <plicease@cpan.org>"

RUN curl https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - 5.39.7 /opt/perl/5.39.7/ -Dusedevel

RUN curl https://cpanmin.us | /opt/perl/5.39.7/bin/perl5.39.7 - App::cpanminus && rm -rf ~/.cpanm

RUN /opt/perl/5.39.7/bin/cpanm -n -L /opt/refileutils App::RegexFileUtils
ADD rc/reln-wrapper /opt/refileutils/bin/reln-wrapper
RUN chmod +x /opt/refileutils/bin/reln-wrapper
RUN ln -s /opt/refileutils/bin/reln-wrapper /opt/perl/5.39.7/bin/reln

ENV PATH /opt/perl/5.39.7/bin:/home/cip/bin:/home/cip/.cargo/bin:/usr/local/go/bin:$PATH

RUN bash -c 'cd /opt/perl/5.39.7/bin; reln -s "s/5.39.7$//"'

RUN cpanm -n -L /opt/dzil Dist::Zilla && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil Dist::Zilla::PluginBundle::Author::Plicease && rm -rf ~/.cpanm
RUN cpanm -n -L /opt/dzil App::af && rm -rf ~/.cpanm

ADD rc/dzil-cpanm   /opt/perl/5.39.7/bin
ADD rc/dzil-dzil    /opt/perl/5.39.7/bin
ADD rc/dzil-af      /opt/perl/5.39.7/bin
ADD rc/dzil-wrapper /opt/perl/5.39.7/bin

RUN chmod +x /opt/perl/5.39.7/bin/dzil-*

ENV CI true
ENV CIPSOMETHING true
ENV CONTINUOUS_INTEGRATION true
ENV CIPDIST bullseye
ENV ALIEN_DOWNLOAD_RULE digest_or_encrypt
