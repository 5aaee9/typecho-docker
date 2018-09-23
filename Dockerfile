FROM 7.2.10-fpm-alpine3.8
LABEL maintainer="i@indexyz.me"

ENV TYPECHO_VERSION 1.1-17.10.30
COPY run.sh /run.sh

RUN apk --update --no-cache add nginx unzip wget && \
  docker-php-ext-install pdo_mysql && \
  chmod +x /run.sh && \
  mkdir -p /var/www && \
  wget http://typecho.org/downloads/$TYPECHO_VERSION-release.tar.gz -O typecho.tgz && \
  tar zxcf typecho.tgz && \
  mv build/* /var/www && \
  rm -f typecho.tgz 

COPY config/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT [ "sh", "/run.sh" ]