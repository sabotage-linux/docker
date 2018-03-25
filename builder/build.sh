#!/usr/bin/env sh

a="/$0"; a=${a%/*}; a=${a:-.}; a=${a#/}/; SCRIPT_DIR=$(cd "$a"; pwd)

# fetch archive
curl -o $SCRIPT_DIR/rootfs.tar.xz http://ftp.barfooze.de/pub/sabotage/sabotage-1.1.19-x86_64-rootfs-stage2-e0b6285a.tar.xz
