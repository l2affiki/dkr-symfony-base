FROM php:7.2-fpm 

RUN apt update && \
    apt install -y wget

WORKDIR /root
COPY install /root/install
RUN /root/install/composer.sh
