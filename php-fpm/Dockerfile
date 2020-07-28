FROM php:7.2-fpm as builder

RUN apt update
RUN apt install -y wget

WORKDIR /root
COPY install /root/install
RUN /root/install/composer.sh

FROM php:7.2-fpm as build1
COPY --from=builder /usr/local/bin/composer /usr/local/bin

# zip/unzip required by composer
RUN apt update && \
	apt install -y zip \
		libicu-dev

RUN pecl install xdebug && \
	docker-php-ext-enable xdebug

# Requires libicu-dev
RUN docker-php-ext-install intl

# Opcache
RUN docker-php-source extract \
	&& if [ -d "/usr/src/php/ext/opcache" ]; then docker-php-ext-install opcache ; fi \
		&& docker-php-source delete
