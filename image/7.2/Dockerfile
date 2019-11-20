FROM docker.elastic.co/elasticsearch/elasticsearch:7.2.1

ENV ENVTMPL_VERSION 0.0.1
ENV ES_MAX_CLAUSE_COUNT 1024

ADD https://github.com/upfluence/envtmpl/releases/download/v$ENVTMPL_VERSION/envtmpl-linux-amd64-$ENVTMPL_VERSION \
  /usr/bin/envtmpl
RUN chmod +x /usr/bin/envtmpl

COPY --chown=elasticsearch:elasticsearch config/elasticsearch.yml.tmpl /usr/share/elasticsearch/config/
COPY --chown=1000:0 run.sh /usr/local/bin/run.sh

RUN chgrp 0 /usr/local/bin/run.sh && \
    chmod 0775 /usr/local/bin/run.sh

RUN elasticsearch-plugin install --batch repository-s3

RUN bin/elasticsearch-keystore create

ENTRYPOINT ["/usr/local/bin/run.sh"]
# Dummy overridable parameter parsed by entrypoint
CMD ["eswrapper"]

