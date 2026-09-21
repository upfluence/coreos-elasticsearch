.PHONY: build deploy

.EXPORT_ALL_VARIABLES:
ES_VERSION := 9.5.3

build:
	envtmpl -i base/Dockerfile.tmpl -o Dockerfile.base && \
	docker build -t upfluence/elasticsearch:$(ES_VERSION)-base -f Dockerfile.base . && \
	envtmpl -i Dockerfile.tmpl -o Dockerfile && \
	docker build -t upfluence/elasticsearch:$(ES_VERSION) . && \
	rm Dockerfile Dockerfile.base

deploy: build
	docker push upfluence/elasticsearch:$(ES_VERSION)-base && \
	docker push upfluence/elasticsearch:$(ES_VERSION)

