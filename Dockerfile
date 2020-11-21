FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get install -y apt-utils gnupg && \
  apt-get upgrade -y && \
  apt-get install -y curl wget iproute2 iperf dnsutils smbclient && \
  echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  apt-get update && \
  apt-get install -y postgresql-client-11 postgresql-contrib-11
