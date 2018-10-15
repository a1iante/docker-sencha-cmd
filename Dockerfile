FROM openjdk:8-jre-slim
MAINTAINER Vitaliy Podlubnyak <pvawsc@gmail.com>

RUN apt-get update && \
  apt-get -y install lsof procps wget gpg curl unzip && \
  rm -rf /var/lib/apt/lists/*

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/5.1.2.52/SenchaCmd-5.1.2.52-linux-x64.run.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run --mode unattended --prefix /opt && \
    rm /cmd-install.run /cmd.run.zip
