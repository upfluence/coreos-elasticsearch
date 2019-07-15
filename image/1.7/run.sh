#! /bin/sh
/usr/bin/envtmpl -i /elasticsearch/config/elasticsearch.yml.tmpl -o /elasticsearch/config/elasticsearch.yml
/elasticsearch/bin/elasticsearch
