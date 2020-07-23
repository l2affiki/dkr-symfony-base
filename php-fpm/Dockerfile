FROM php:7.2-fpm as builder

RUN apt update
RUN apt install -y wget

WORKDIR /root
COPY install /root/install
RUN /root/install/composer.sh

FROM php:7.2-fpm as build1
COPY --from=builder /usr/local/bin/composer /usr/local/bin
