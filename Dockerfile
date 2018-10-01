FROM php:7.2.10-fpm-alpine3.8
LABEL maintainer="i@indexyz.me"

RUN apk --update --no-cache add nginx git unzip wget curl-dev libcurl && \
  docker-php-ext-install pdo pdo_mysql mbstring bcmath curl && \
  mkdir -p /var/www && \
  wget http://typecho.org/build.tar.gz -O typecho.tgz && \
  tar zxvf typecho.tgz && \
  mv build/* /var/www && \
  rm -f typecho.tgz 

COPY plugins.sh /plugins.sh

RUN chmod +x /plugins.sh && \
  sh /plugins.sh

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY config/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT [ "sh", "/run.sh" ]