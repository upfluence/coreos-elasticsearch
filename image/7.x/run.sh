#! /bin/sh
/usr/local/bin/envtmpl -i /usr/share/elasticsearch/config/elasticsearch.yml.tmpl -o /usr/share/elasticsearch/config/elasticsearch.yml

echo $AWS_ACCESS_KEY | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.access_key
echo $AWS_SECRET_KEY | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.secret_key

/usr/local/bin/docker-entrypoint.sh
