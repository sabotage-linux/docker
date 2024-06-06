
FROM sabotage-nginx-debug
MAINTAINER pbraun@nethence.com

# butch requires sabotage-core
RUN for pkg in `butch list | \
        grep -vE '^nginx|^musl|^libz|^libelf|^base-sys|^libc|^sabotage|^busybox|^libressl|^pcre|^zlib'`; do butch rm $pkg; done; unset pkg

RUN rm -rf /etc/services/
RUN rm -rf /src/
RUN rm -f /root/.bashrc

ENTRYPOINT ["/opt/nginx/bin/nginx", "-g", "daemon off;"]

