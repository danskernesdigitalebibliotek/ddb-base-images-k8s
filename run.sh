#!/bin/sh

#docker build --no-cache --tag="danskernesdigitalebibliotek/php7.3-fpm-base:latest" --file="php7.3-fpm-base/Dockerfile" php7.3-fpm-base
docker build --no-cache --tag="danskernesdigitalebibliotek/php7.4-fpm-base:latest" --file="php7.4-fpm-base/Dockerfile" php7.4-fpm-base
#docker build --no-cache --tag="danskernesdigitalebibliotek/elasticsearch_exporter:latest" --file="elasticsearch_exporter/Dockerfile" elasticsearch_exporter

#docker push danskernesdigitalebibliotek/php7.3-fpm-base:latest
#docker push danskernesdigitalebibliotek/php7.4-fpm-base:latest
#docker push danskernesdigitalebibliotek/elasticsearch_exporter:latest
