#!/bin/bash

apt-get -y update
apt-get -y install composer

apt-get -y install vim
apt-get -y install phpunit
composer create-project --prefer-dist laravel/laravel:^7.0 .

service nginx start
service php7.4-fpm start

while true; do sleep 1000; done