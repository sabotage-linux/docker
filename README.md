# sabotage-docker

Docker images based on [Sabotage Linux](http://sabotage.tech/).

## Build image

Images' dependencies

	sabotage-stage1 based on chroot archive
	sabotage-nginx-debug based on sabotage-stage1
	sabotage-nginx based on sabotage-nginx-debug
	sabotage-custom based on sabotage-stage1

Eventually use the stage1 archive from nethence (updated once in a while) to build all the images

	git clone https://github.com/sabotage-linux/docker sabotage-docker
	cd sabotage-docker/
	./build-from-archive.sh

