
FROM sabotage-stage1
MAINTAINER pbraun@nethence.com

COPY install.ash /root/
RUN /root/install.ash

#ENTRYPOINT ["/opt/busybox/bin/init"]
ENTRYPOINT ["/opt/dumb-init/bin/dumb-init", "--"]
CMD ["/opt/busybox/bin/crond", "-f"]

