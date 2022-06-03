FROM opensuse/leap

RUN zypper ref
RUN zypper in -y wget tar gzip make perl
RUN wget https://cpan.metacpan.org/authors/id/S/SH/SHANCOCK/Perl-Tidy-20211029.tar.gz
RUN tar zxvf Perl-Tidy-20211029.tar.gz
RUN cd Perl-Tidy-20211029 && perl Makefile.PL && make && make test && make install
RUN cd / && wget https://raw.githubusercontent.com/os-autoinst/os-autoinst/master/.perltidyrc
COPY perltidy.sh /usr/bin
RUN chmod a+x /usr/bin/perltidy.sh

