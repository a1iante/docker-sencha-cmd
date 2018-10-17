FROM openjdk:8-jre-slim
MAINTAINER Vitaliy Podlubnyak <pvawsc@gmail.com>

RUN apt-get update && \
  apt-get -y install lsof procps wget gpg curl unzip && \
  rm -rf /var/lib/apt/lists/*

RUN echo "deb http://http.debian.net/debian/ jessie main" >> /etc/apt/sources.list.d/jessie.list
RUN echo "Package: *" >> /etc/apt/preferences.d/jessie.pref
RUN echo "Pin: release a=jessie" >> /etc/apt/preferences.d/jessie.pref
RUN echo "Pin-Priority: 400" >> /etc/apt/preferences.d/jessie.pref

RUN echo "Package: ruby2.0" >> /etc/apt/preferences.d/ruby.pref
RUN echo "Pin: release a=jessie" >> /etc/apt/preferences.d/ruby.pref
RUN echo "Pin-Priority: 600" >> /etc/apt/preferences.d/ruby.pref
RUN echo "Package: bundler" >> /etc/apt/preferences.d/ruby.pref
RUN echo "Pin: release a=jessie" >> /etc/apt/preferences.d/ruby.pref
RUN echo "Pin-Priority: 600" >> /etc/apt/preferences.d/ruby.pref

RUN apt-get update
RUN apt-get install -y ruby2.0 bundler

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/5.1.2.52/SenchaCmd-5.1.2.52-linux-x64.run.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run --mode unattended --prefix /opt && \
    rm /cmd-install.run /cmd.run.zip

ENTRYPOINT ["/opt/Sencha/Cmd/5.1.2.52/sencha"]
