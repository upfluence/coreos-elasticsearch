#! /bin/sh

for path in /data/logs /data/log /data/work; do
  mkdir -p ${path}
  chown -R elasticsearch:elasticsearch /data
done

/usr/bin/envtmpl -i ${ES_HOME}/config/elasticsearch.yml.tmpl -o ${ES_HOME}/config/elasticsearch.yml
exec su-exec elasticsearch ${ES_HOME}/bin/elasticsearch
