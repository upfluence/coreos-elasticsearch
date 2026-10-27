#! /bin/sh
# envtmpl opens the output without truncating it
/usr/bin/envtmpl -i /usr/share/elasticsearch/config/elasticsearch.yml.tmpl > /usr/share/elasticsearch/config/elasticsearch.yml

exec /usr/local/bin/docker-entrypoint.sh "$@"
