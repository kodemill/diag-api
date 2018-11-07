.PHONY: build-image push-image

IMAGE := kodemill/diag-api

build-image:
	docker build -t $(IMAGE) .

push-image:
	docker push $(IMAGE)
