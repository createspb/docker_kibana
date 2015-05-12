FROM phusion/baseimage:0.9.16

MAINTAINER Vladimir Shulyak "vladimir@shulyak.net" (prev: Deni Bertovic "me@denibertovic.com")

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates wget

RUN wget https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz -O /tmp/kibana.tar.gz 2> /dev/null

RUN tar zxvf /tmp/kibana.tar.gz -C /tmp && mv /tmp/kibana-4.0.2-linux-x64 /kibana && rm -rf /tmp/*

RUN mkdir /logs

ADD start_kibana.sh /etc/service/kibana/run
RUN chmod 755 /etc/service/kibana/run

VOLUME ["/kibana/config", "/logs"]