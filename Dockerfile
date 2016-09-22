FROM ubuntu:trusty

MAINTAINER Andraz Krascek <andraz.krascek@3fs.si>

RUN apt-get update && \
    apt-get install -y --fix-missing \
        postfix

ADD run.sh /opt/run.sh

RUN apt-get clean
RUN rm -rf /tmp/* /var/tmp/*
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 25

CMD /opt/run.sh
