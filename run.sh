#!/bin/sh

(cd php7.3-fpm-base && docker build --no-cache --tag=docker.pkg.github.com/danskernesdigitalebibliotek/ddb-base-images-k8s/php7.3-fpm-base .)

docker push docker.pkg.github.com/danskernesdigitalebibliotek/ddb-base-images-k8s/php7.3-fpm-base:latest
