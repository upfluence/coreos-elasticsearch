#! /bin/sh
/usr/bin/envtmpl -i ${ES_HOME}/config/elasticsearch.yml.tmpl -o ${ES_HOME}/config/elasticsearch.yml
/elasticsearch/bin/elasticsearch
