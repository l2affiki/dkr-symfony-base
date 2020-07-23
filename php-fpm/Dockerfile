FROM php:7.2-fpm as builder

RUN apt update
RUN apt install -y wget zip

WORKDIR /root
COPY install /root/install
RUN /root/install/composer.sh

#FROM php:7.2-fpm as build1
# pdo_sqlite : required by symfony/demo
RUN docker-php-ext-install -j$(nproc) pdo_sqlite
#COPY --from=builder /usr/local/bin/composer /usr/local/bin
