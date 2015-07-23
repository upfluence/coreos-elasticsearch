FROM debian:jessie
MAINTAINER Julien Levesy <julien.levesy@upfluence.co>

ENV ENVTMPL_VERSION 0.0.1
ADD https://github.com/upfluence/envtmpl/releases/download/v$ENVTMPL_VERSION/envtmpl-linux-amd64-$ENVTMPL_VERSION \
  /usr/bin/envtmpl
RUN chmod +x /usr/bin/envtmpl

RUN apt-get update && \
  apt-get install -y ca-certificates-java openjdk-7-jre && \
  apt-get clean -y

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ENV ES_VERSION 1.7.0

ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz \
  /tmp/elasticsearch.tar.gz

WORKDIR /tmp

RUN tar xvzf elasticsearch.tar.gz && \
    mv elasticsearch-$ES_VERSION /elasticsearch && \
    rm /elasticsearch/config/elasticsearch.yml

WORKDIR /

ADD config/elasticsearch.yml.tmpl /elasticsearch/config/elasticsearch.yml.tmpl
ADD run.sh /elasticsearch/run.sh
RUN chmod +x /elasticsearch/run.sh

VOLUME ["/data"]

ENV ES_HOME /elasticsearch

ENV ES_AWS_VERSION 2.7.0

RUN /elasticsearch/bin/plugin install elasticsearch/elasticsearch-cloud-aws/$ES_AWS_VERSION

CMD ["/elasticsearch/run.sh"]
