.PHONY: build deploy

.EXPORT_ALL_VARIABLES:
ES_VERSION := 7.12.0

build:
	envtmpl -i Dockerfile.tmpl -o Dockerfile && \
	docker build -t upfluence/elasticsearch:$(ES_VERSION) . && \
	rm Dockerfile

deploy: build
	docker push upfluence/elasticsearch:$(ES_VERSION)

