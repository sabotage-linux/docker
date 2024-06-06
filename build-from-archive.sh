#!/bin/bash
set -e

[[ -d sabotage-stage1/sabotage/ ]] && echo folder sabotage-stage1/sabotage/ already exists && exit 1

if [[ -f sabotage-stage1/sabotage-stage1.tar.gz ]]; then
	echo sabotage-stage1/sabotage-stage1.tar.gz already there
else
	# fetch archive from nethence
	wget https://lab.nethence.com/sabotage-stage1.tar.gz -O sabotage-stage1/sabotage-stage1.tar.gz
fi

echo -n extracting archive ...
tar xzf sabotage-stage1/sabotage-stage1.tar.gz -C sabotage-stage1/ && echo done
echo

# docker images | grep sabotage
# docker run --name test -ti sabotage-stage1 ash
# ping -c1 opendns.com
# ^D
# docker rm test

echo building sabotage-stage1
docker build -t sabotage-stage1 sabotage-stage1/
echo

echo building sabotage-nginx-debug
docker build -t sabotage-nginx-debug sabotage-nginx-debug/
echo

echo building sabotage-nginx
docker build -t sabotage-nginx sabotage-nginx/
echo

echo building sabotage-custom
docker build -t sabotage-custom sabotage-custom/
echo

echo all done
echo

