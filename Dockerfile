FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

SHELL [ "/bin/bash", "-c" ]

RUN \
  apt-get update && \
  apt-get install -y apt-utils && \
  apt-get upgrade -y && \
  apt-get install -y gnupg2 apt-transport-https vim curl wget

# Networking
RUN \
  apt-get install -y \
    iproute2 iperf net-tools iputils-ping iputils-arping iputils-clockdiff iputils-tracepath netcat nmap \
    dnsutils \
    nfs-common mount smbclient

# Postgres
RUN \
  curl -Ls https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor > /usr/share/keyrings/postgresql-archive-keyring.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  apt-get update && \
  apt-get install -y postgresql-client-14 postgresql-contrib-14

# SQL Server
RUN \
  curl -Ls https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
  curl -Ls https://packages.microsoft.com/config/ubuntu/22.04/prod.list -o /etc/apt/sources.list.d/msprod.list && \
  apt-get update && \
  ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev

# Oracle
RUN \
  curl -Ls "https://download.oracle.com/otn_software/linux/instantclient/217000/oracle-instantclient-basiclite-21.7.0.0.0-1.el8.x86_64.rpm" -o /tmp/oracle-instantclient-basiclite.rpm && \
  curl -Ls "https://download.oracle.com/otn_software/linux/instantclient/217000/oracle-instantclient-sqlplus-21.7.0.0.0-1.el8.x86_64.rpm" -o /tmp/oracle-instantclient-sqlplus.rpm && \
  apt-get install -y alien libaio1 && \
  alien -i /tmp/oracle-instantclient-basiclite.rpm && \
  alien -i /tmp/oracle-instantclient-sqlplus.rpm && \
  echo "/usr/lib/oracle/21/client64/lib" > /etc/ld.so.conf.d/oracle.conf && \
  ldconfig

COPY bin/ /usr/local/bin/

CMD [ "/bin/bash" ]
