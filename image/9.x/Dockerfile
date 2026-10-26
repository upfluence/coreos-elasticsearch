ARG ES_VERSION
FROM upfluence/elasticsearch:${ES_VERSION}-base

ARG ENVTMPL_VERSION=0.0.5

ADD --chown=1000:0 --chmod=0775 https://github.com/upfluence/envtmpl/releases/download/v${ENVTMPL_VERSION}/envtmpl-linux-amd64 \
  /usr/bin/envtmpl

COPY --chown=elasticsearch:elasticsearch config/elasticsearch.yml.tmpl /usr/share/elasticsearch/config/
COPY --chown=1000:0 --chmod=0775 run.sh /usr/local/bin/run.sh

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/run.sh"]
# Dummy overridable parameter parsed by entrypoint
CMD ["eswrapper"]
