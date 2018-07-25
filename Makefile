all:

UID := $(shell id -u)
GID := $(shell id -g)

DOCKER ?= docker
DOCKER_IMAGE ?= tsukuten/texlive
DOCKER_RUN := $(DOCKER) run --rm -it -u "$(UID):$(GID)" \
              -v "$(PWD):/tmp/work:rw" "$(DOCKER_IMAGE)"

all: main.pdf

.PHONY: main.pdf
main.pdf: main.tex
	$(DOCKER_RUN) sh -c 'cd /tmp/work/ && latexmk'

.PHONY: clean
clean:
	$(DOCKER_RUN) sh -c 'cd /tmp/work/ && latexmk -C'
