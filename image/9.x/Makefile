.PHONY: build deploy

ES_VERSION := 9.5.5

build:
	docker build --build-arg ES_VERSION=$(ES_VERSION) -t upfluence/elasticsearch:$(ES_VERSION)-base base && \
	docker build --build-arg ES_VERSION=$(ES_VERSION) -t upfluence/elasticsearch:$(ES_VERSION) .

deploy: build
	docker push upfluence/elasticsearch:$(ES_VERSION)-base && \
	docker push upfluence/elasticsearch:$(ES_VERSION)
