.PHONY: build-image push-image

IMAGE=kodemill/diag-api
LATEST_TAG=$(IMAGE):latest
BUILD_TAG=$(IMAGE):$(TRAVIS_BUILD_NUMBER)

build:
	docker build -t $(IMAGE) .

tag:
	docker tag $(IMAGE) $(LATEST_TAG)
	docker tag $(IMAGE) $(BUILD_TAG)

push:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	docker push $(LATEST_TAG)
	docker push $(BUILD_TAG)
