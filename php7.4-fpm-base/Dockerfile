FROM php:7.4-fpm-alpine
LABEL maintainer="ITK Dev <itkdev@mkb.aarhus.dk>"

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0" \
    PHP_OPCACHE_MAX_ACCELERATED_FILES="20000" \
    PHP_OPCACHE_MEMORY_CONSUMPTION="192" \
    PHP_OPCACHE_MAX_WASTED_PERCENTAGE="10" \
    PHP_OPCACHE_PRELOAD_PATH="" \
    PHP_OPCACHE_PRELOAD_USER="www-data" \
    PHP_APCU_MEMORY_SIZE="16M" \
    PHP_MAX_EXECUTION_TIME="30" \
    PHP_MEMORY_LIMIT="128M" \
    PHP_POST_MAX_SIZE="8M" \
    PHP_UPLOAD_MAX_FILESIZE="2M" \
    PHP_PM_TYPE="dynamic" \
    PHP_PM_MAX_CHILDREN="40" \
    PHP_PM_MAX_REQUESTS="0" \
    PHP_PM_START_SERVERS="5" \
    PHP_PM_MIN_SPARE_SERVERS="5" \
    PHP_PM_MAX_SPARE_SERVERS="8" \
    TZ=Europe/Copenhagen

# The fcgi packaged is required by the FPM healtcheck script.
RUN apk --update add --no-cache \
        libxml2-dev \
        libzip-dev \
        fcgi \
        rabbitmq-c-dev \
        tzdata \
    && docker-php-ext-install -j$(nproc) \
        zip \
        opcache \
        mysqli \
        pdo_mysql \
        soap \
        sysvsem

RUN apk --update add --no-cache --virtual .build-deps autoconf g++ make \
    && pecl install redis-4.0.1 apcu amqp \
    && docker-php-ext-enable redis apcu amqp\
    && apk del .build-deps

# Added cache tool.
ADD https://gordalina.github.io/cachetool/downloads/cachetool.phar /usr/local/bin/cachetool
RUN chmod +x /usr/local/bin/cachetool

# Added FPM health check script (https://github.com/renatomefi/php-fpm-healthcheck)
ADD https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck /usr/local/bin/php-fpm-healthcheck
RUN chmod +x /usr/local/bin/php-fpm-healthcheck

# Use default PHP production configuration.
RUN mv ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini

# Copy custom PHP configuration.
COPY etc/php/conf.d/opcache.ini /usr/local/etc/php/conf.d/20-opcache.ini
COPY etc/php/conf.d/php.ini /usr/local/etc/php/conf.d/20-php.ini
COPY etc/php/conf.d/apcu.ini /usr/local/etc/php/conf.d/05-apcu.ini


# Custom FPM configuration.
COPY etc/php-fpm.d/fpm.ini /usr/local/etc/php-fpm.d/zz-fpm-docker.conf
