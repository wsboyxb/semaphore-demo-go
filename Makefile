.PHONY: test test.setup run

GOLANG_IMAGE=golang:1.16


run:
	docker run \
		--network=host \
		-it \
		-v $$PWD:/app \
		$(GOLANG_IMAGE) $(CMD)

test:
	$(MAKE) run CMD="/bin/bash -c \"cd /app && go get gotest.tools/gotestsum && gotestsum --junitfile junit.xml ./...\""

test.setup:
	$(MAKE) run CMD="/bin/bash -c \"cd /app && go get ./...\""