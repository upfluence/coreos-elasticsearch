#! /bin/sh
/usr/bin/envtmpl -i /usr/share/elasticsearch/config/elasticsearch.yml.tmpl -o /usr/share/elasticsearch/config/elasticsearch.yml

/usr/local/bin/docker-entrypoint.sh
