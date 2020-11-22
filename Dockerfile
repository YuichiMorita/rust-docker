From centos:7

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN yum -y install wget openssl openssl-devel postgresql-devel gcc libpng libjpeg icu libX11 libXext libXrender xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi git ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos7.x86_64.rpm && rpm -Uvh wkhtmltox-0.12.6-1.centos7.x86_64.rpm

RUN cargo install diesel_cli --no-default-features --features postgres
