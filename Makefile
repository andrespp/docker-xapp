IMAGE=xapps
APP=xcalc

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@echo "  help\t\tPrint this help"
	@echo "  test\t\tLookup for docker and docker-compose binaries"
	@echo "  setup\t\tBuild docker images"
	@echo "  run [app]\tRun app defined in '\$$APP' (xcalc by default)"
	@echo ""
	@echo "Example: make run APP=xeyes"

.PHONY: test
test:
	@which docker
	@which docker-compose
	@which xauth

.PHONY: setup
setup: Dockerfile
	docker image build -t $(IMAGE) .

.PHONY: run
run:
	@echo $(APP)
	docker run -it --rm -v /tmp/.X11-unix/:/tmp/.X11-unix/:ro \
	-e XAUTH=$$(xauth list|grep `uname -n` | cut -d ' ' -f5) -e "DISPLAY" \
       	$(IMAGE) $(APP)
