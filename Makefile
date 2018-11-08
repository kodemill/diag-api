.PHONY: build-image push-image

IMAGE := kodemill/diag-api

build-image:
	docker build -t $(IMAGE) .

push-image:
	echo $(DOCKER_PASSWORD) | docker login -u $(DOCKER_USERNAME) --password-stdin
	docker push $(IMAGE)
