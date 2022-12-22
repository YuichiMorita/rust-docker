From centos:7

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN yum -y install wget openssl openssl-devel postgresql-devel gcc gcc-c++ libpng libjpeg icu libX11 libXext libXrender xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi git ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts freetype-devel freetype2-devel expat-devel libxml2-devel libxslt-devel pkg-config  libssl-dev libfreetype6-dev libexpat1-dev libxcb-composite0-dev libasound2-dev
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos7.x86_64.rpm && rpm -Uvh wkhtmltox-0.12.6-1.centos7.x86_64.rpm

RUN cargo install diesel_cli --no-default-features --features postgres

#CMAKE install
RUN wget https://github.com/Kitware/CMake/releases/download/v3.23.0-rc4/cmake-3.23.0-rc4.tar.gz && tar xvfz cmake-3.23.0-rc4.tar.gz && cd cmake-3.23.0-rc4/ && ./bootstrap && make &&make install

#glib2.18 install
RUN wget --no-check-certificate https://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz && tar zxvf glibc-2.18.tar.gz && cd glibc-2.18 && mkdir build &&cd build && ../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin

RUN localedef -f UTF-8 -i ja_JP ja_JP

RUN touch /usr/local/cargo/config && echo -e "[net]\ngit-fetch-with-cli = true" >> /usr/local/cargo/config
RUN rustup update

RUN cd /etc/pki/tls/certs/ &&wget http://curl.haxx.se/ca/cacert.pem --no-check-certificate&&mv ./cacert.pem ./ca-bundle.crt
