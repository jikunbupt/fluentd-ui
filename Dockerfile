FROM ruby:2.7.0-slim

LABEL maintainer="Fluentd developers <fluentd@googlegroups.com>"
LABEL description="fluentd-ui docker image"
LABEL Vendor="Fluent Organization"

COPY ./sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y --allow-remove-essential --allow-downgrades \
    build-essential \
    gcc \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    ruby-dev \
    dpkg-dev \
    ruby2.3-dev \
    libruby2.3 \
    perl \
    libdpkg-perl \
    gnupg2 \
    libalgorithm-merge-perl \
    libncurses5 \
    libtinfo5 \
    rake \
    libssl1.0.2 \
    perl-base=5.28.1-6+deb10u1 \
    perl-modules-5.28=5.28.1-6+deb10u1 \
    libperl5.28=5.28.1-6+deb10u1 \
    netbase \
    rename \
    vim \
 && rm -vrf /var/lib/apt/lists/*

RUN gem sources --remove https://rubygems.org/ && gem sources -a https://gems.ruby-china.com && gem install fluentd-ui

EXPOSE 9292

ENTRYPOINT [ "fluentd-ui", "start" ]
