FROM alpine:3.3
MAINTAINER Julien Levesy <julien@upfluence.co>

ENV ENVTMPL_VERSION 0.0.1
ENV ES_VERSION=2.3.2 ES_HOME=/usr/share/elasticsearch

ENV COMMUNITY_REPO=http://nl.alpinelinux.org/alpine/edge/community
ENV ENVTPL_REPO=https://github.com/upfluence/envtmpl/releases/download/v${ENVTMPL_VERSION}/envtmpl-linux-amd64-${ENVMTPL_VERSION}
ENV ES_REPO=https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz


RUN echo "@community ${COMMUNITY_REPO}" >> /etc/apk/repositories && \
    apk add --update openjdk8@community curl && \
    rm -rf /var/cache/apk/* && \
    curl ${ENVTPL_REPO} > /usr/bin/envtmpl && \
    chmod +x /usr/bin/envtmpl && \
    curl -s ${ES_REPO} | tar zx -C /usr/share && \
    ln -s ${ES_HOME}-${ES_VERSION} ${ES_HOME} && \
    ${ES_HOME}/bin/plugin install --verbose cloud-aws && \
    rm ${ES_HOME}/config/elasticsearch.yml

ADD config/elasticsearch.yml.tmpl /usr/share/elasticsearch/config/elasticsearch.yml.tmpl
ADD run.sh /usr/share/elasticsearch/run.sh
RUN chmod +x /usr/share/elasticsearch/run.sh

VOLUME ["/data"]

CMD ["/usr/share/elasticsearch/run.sh"]
