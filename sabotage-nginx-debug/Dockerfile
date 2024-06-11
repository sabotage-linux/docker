
FROM sabotage-stage1
MAINTAINER pbraun@nethence.com

RUN butch install bash
RUN echo /bin/bash >> /etc/shells
RUN echo alias ll=\'ls --color-auto -alh\' >> /root/.bashrc

RUN butch install nginx
RUN mkdir -p /var/www/html/
RUN echo '<p>welcome to sabotage linux' > /var/www/html/index.html

RUN mv -i /etc/nginx/nginx.conf /etc/nginx/nginx.conf.dist
RUN sed 's/root   html/root   \/var\/www\/html/' /etc/nginx/nginx.conf.dist > /etc/nginx/nginx.conf

RUN rm -f /var/log/nginx/access.log
RUN rm -f /var/log/nginx/error.log
RUN ln -s /dev/stdout /var/log/nginx/access.log
RUN ln -s /dev/stderr /var/log/nginx/error.log

ENTRYPOINT ["/opt/nginx/bin/nginx", "-g", "daemon off;"]

