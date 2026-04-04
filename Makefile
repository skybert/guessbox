GUESS_CONTAINER_CMD ?= podman
GUESS_DATA_DIR ?= $(HOME)/.guessbox
GUESS_SRC_DIR ?= $(HOME)/src

run: build
	mkdir -p $(GUESS_DATA_DIR)
	cp -n etc/.bashrc $(GUESS_DATA_DIR)/

	$(GUESS_CONTAINER_CMD) \
	  run \
	  --user me \
	  --userns=keep-id:uid=1000,gid=1000 \
	  --hostname guessbox \
	  --mount type=bind,src=$(GUESS_DATA_DIR),dst=/home/me \
	  --mount type=bind,src=$(GUESS_SRC_DIR),dst=/home/me/src \
	  -ti guessbox:latest \
	  /bin/bash

build: Dockerfile
	podman build -t guessbox:latest .
