FROM ubuntu:14.04.3

MAINTAINER Mikael Göransson <github@mgor.se>

ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGE AdbeRdr9.5.5-1_i386linux_enu.deb
ENV uid 1000
ENV gid 1000

RUN useradd -m acroread; \
    dpkg --add-architecture i386; \
    apt-get update; \
    apt-get install -y  wget \
                        cups-bsd \
                        libcups2 \
                        libgtk2.0-0:i386 \
                        libnss3-1d:i386 \
                        libnspr4-0d:i386 \
                        lib32nss-mdns \
                        libxml2:i386 \
                        libxslt1.1:i386 \
                        libidn11:i386 \
                        libpangox-1.0-0:i386 \
                        libpangoxft-1.0-0:i386 \
                        libstdc++6:i386 \
                        libcanberra-gtk-module:i386; \
    rm -rf /var/lib/apt/lists/*

RUN wget -q http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/$PACKAGE -O /tmp/$PACKAGE; \
    dpkg -i  /tmp/$PACKAGE; \
    rm /tmp/$PACKAGE

COPY start-acroread.sh /tmp/

ENTRYPOINT ["/tmp/start-acroread.sh"]
