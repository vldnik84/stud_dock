FROM ubuntu:xenial
# based on romeOz <serggalka@gmail.com> package

ENV OS_LOCALE="en_US.UTF-8"
RUN apt-get update && apt-get install -y locales && locale-gen ${OS_LOCALE}
ENV LANG=${OS_LOCALE} \
    LANGUAGE=${OS_LOCALE} \
    LC_ALL=${OS_LOCALE} \
    DEBIAN_FRONTEND=noninteractive

ENV NGINX_CONF_DIR=/etc/nginx \
    PHP_DATA_DIR=/var/lib/php

RUN	\
    BUILD_DEPS='software-properties-common python-software-properties' \
    && dpkg-reconfigure locales \
    && apt-get install --no-install-recommends -y $BUILD_DEPS \
    && add-apt-repository -y ppa:ondrej/php \
    && add-apt-repository -y ppa:nginx/stable \
    && apt-get update \
    # Install core apps
    && apt-get install -y curl nginx git \
    # Install PHP with modules
    && apt-get install -y php7.2-fpm php7.2-cli php7.2-readline php7.2-mbstring php7.2-zip php7.2-common \
    && apt-get install -y php7.2-intl php7.2-xml php7.2-json php7.2-curl php7.2-gd php7.2-pgsql php7.2-mysql php-pear php-xdebug \
    # Install composer v1.6.5
    && curl -sS https://getcomposer.org/installer | php -- --version=1.6.5 --install-dir=/usr/local/bin --filename=composer \
    # Cleaning
    && apt-get purge -y --auto-remove $BUILD_DEPS \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    # Forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
	# Service commands
    && chown www-data:www-data ${PHP_DATA_DIR} -Rf

EXPOSE 80 443

# By default, simply start nginx
# CMD ["nginx", "-g", "daemon off;"]
