# docker-sabotage

A super small Docker image based on [Sabotage Linux](http://sabotage.tech/).

# How to build

Prerequisite:
* docker CE or similar
* Unix shell

```sh
git clone sabotage-linux/docker sabotage-docker
cd sabotage-docker/builder

docker build -t my-sabotage .

# once successfully built
docker run -it my-sabotage
```
