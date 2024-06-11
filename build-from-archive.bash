#!/bin/bash
set -e

if [[ -f sabotage-stage1.tar.gz ]]; then
	echo sabotage-stage1.tar.gz already there
else
	# fetch archive from nethence
	wget https://lab.nethence.com/sabotage-stage1.tar.gz
fi

# hardcoded checksum from 19 Feb 2024 stage1 tarball
sha256_hardcoded=642424285c14421dabecb2fb4264f854e0f46bbc58299282ea904ca8572cce98

echo -n checking archive ...
sha256_check=`sha256sum sabotage-stage1.tar.gz | awk '{print $1}'`
[[ ! $sha256_hardcoded = $sha256_check ]] && echo error: wrong sha256 sum && exit 1 || echo done

echo -n extracting archive ...
[[ -d sabotage-stage1/sabotage/ ]] && echo error: folder sabotage-stage1/sabotage/ already exists \
	-- make sure nothing is mounted within before removal && exit 1
tar xzf sabotage-stage1.tar.gz -C sabotage-stage1/ && echo done
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

