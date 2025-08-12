.PHONY: build deploy

.EXPORT_ALL_VARIABLES:
ES_VERSION := 8.19.0

build:
	envtmpl -i base/Dockerfile.tmpl -o DockerfileBase && \
	docker build -t upfluence/elasticsearch:$(ES_VERSION)-base -f DockerfileBase . && \
	envtmpl -i Dockerfile.tmpl -o Dockerfile && \
	docker build -t upfluence/elasticsearch:$(ES_VERSION) . && \
	rm Dockerfile DockerfileBase

deploy: build
	docker push upfluence/elasticsearch:$(ES_VERSION)-base && \
	docker push upfluence/elasticsearch:$(ES_VERSION)

