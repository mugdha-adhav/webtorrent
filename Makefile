.DEFAULT_GOAL := run-cli
.PHONY: build-cli build-desktop build-browser build-all run-cli run-desktop

#Docker Tasks
build-all: build-cli build-desktop build-browser

build-cli:
	@echo "Creating a WebTorrent CLI docker image"
	@docker build -t mugdhaadhav/webtorrent-cli:1.0 -f cli/Dockerfile --no-cache .
	@echo "Docker image build successfully!!"

run-cli:
	@echo "Starting the container"
	@docker run --rm -it -v /home/mugdha/docker-images/webtorrent/Downloads:/downloads --name webtorrent-cli-demo mugdhaadhav/webtorrent-cli:1.0 /bin/sh

build-browser:
	@echo "Creating a WebTorrent browser docker image"
	@docker build -t mugdhaadhav/webtorrent-browser:1.0 -f browser/Dockerfile --no-cache .
	@echo "Docker image build successfully!!"

run-browser:
	@echo "Starting the container"
	@docker run --rm -it --net=host --env="DISPLAY" --name webtorrent-browser-env -v /home/mugdha/docker-images/webtorrent/Downloads:/home/firefox/Downloads -v "/run/user/1000/gdm/Xauthority:/root/.Xauthority:rw" mugdhaadhav/webtorrent-browser:1.0 

build-desktop:
	@echo "Creating a WebTorrent Desktop docker image"
	@docker build -t mugdhaadhav/webtorrent-desktop:1.0 -f desktop/Dockerfile --no-cache .
	@echo "Docker image build successfully!!"

run-desktop:
	@echo "Starting the container"
	@docker run --rm -it --net=host --env="DISPLAY" -v="/run/user/1000/gdm/Xauthority:/root/.Xauthority:rw" -v /home/mugdha/docker-images/webtorrent/Downloads:/home/webtorrent/downloads --name webtorrent-desk-env mugdhaadhav/webtorrent-desktop:1.0

build-test:
	@echo "Creating a WebTorrent browser docker image"
	@docker build -t mugdhaadhav/webtorrent-test:1.0 -f test/Dockerfile .
	@echo "Docker image build successfully!!"

run-test:
	@echo "Starting the container"
	@docker run --rm -it --net=host --env DISPLAY=unix${DISPLAY} --device /dev/snd --name webtorrent-browser-test -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/mugdha/docker-images/webtorrent/Downloads:/home/firefox/Downloads mugdhaadhav/webtorrent-test:1.0
 
