all:

UID := $(shell id -u)
GID := $(shell id -g)

DOCKER ?= docker
# No, I'm not an newbie! I just don't know which was the official e-mail address
# of our club, so I cannot create an organization on Docker Hub.
DOCKER_IMAGE ?= 9da3f7db48d9
DOCKER_RUN := $(DOCKER) run --rm -it -u "$(UID):$(GID)" \
              -v "$(PWD):/tmp/work:rw" "$(DOCKER_IMAGE)"

all: main.pdf

.PHONY: main.pdf
main.pdf: main.tex
	$(DOCKER_RUN) sh -c 'cd /tmp/work/ && latexmk'

.PHONY: clean
clean:
	$(DOCKER_RUN) sh -c 'cd /tmp/work/ && latexmk -C'
