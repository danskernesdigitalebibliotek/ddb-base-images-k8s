#!/bin/sh

VERSION=1.0.5

docker build --no-cache --tag="danskernesdigitalebibliotek/php7.3-fpm-base:latest" --file="php7.3-fpm-base/Dockerfile" php7.3-fpm-base
docker build --no-cache --tag="danskernesdigitalebibliotek/php7.4-fpm-base:latest" --file="php7.4-fpm-base/Dockerfile" php7.4-fpm-base
docker build --no-cache --tag="danskernesdigitalebibliotek/php8.0-fpm-base:latest" --file="php8.0-fpm-base/Dockerfile" php8.0-fpm-base

docker build --no-cache --tag="danskernesdigitalebibliotek/elasticsearch_exporter:latest" --file="elasticsearch_exporter/Dockerfile" elasticsearch_exporter

docker image tag danskernesdigitalebibliotek/php7.3-fpm-base danskernesdigitalebibliotek/php7.3-fpm-base:${VERSION}
docker push danskernesdigitalebibliotek/php7.3-fpm-base:${VERSION}
docker push danskernesdigitalebibliotek/php7.3-fpm-base:latest

docker image tag danskernesdigitalebibliotek/php7.4-fpm-base danskernesdigitalebibliotek/php7.4-fpm-base:${VERSION}
docker push danskernesdigitalebibliotek/php7.4-fpm-base:${VERSION}
docker push danskernesdigitalebibliotek/php7.4-fpm-base:latest

docker image tag danskernesdigitalebibliotek/php8.0-fpm-base danskernesdigitalebibliotek/php8.0-fpm-base:${VERSION}
docker push danskernesdigitalebibliotek/php8.0-fpm-base:${VERSION}
docker push danskernesdigitalebibliotek/php8.0-fpm-base:latest

docker image tag danskernesdigitalebibliotek/elasticsearch_exporter danskernesdigitalebibliotek/elasticsearch_exporter:${VERSION}
docker push danskernesdigitalebibliotek/elasticsearch_exporter:${VERSION}
docker push danskernesdigitalebibliotek/elasticsearch_exporter:latest
