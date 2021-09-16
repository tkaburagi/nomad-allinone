#!/bin/sh

nomad job stop -purge periodic-curl
nomad job stop -purge periodic-backup
nomad job stop -purge parameterized-toUpper
nomad job stop -purge ui-java
nomad job stop -purge front-api-golang

mysql -h ${MYSQL_HOST} -u root -prooooot -D handson -e "drop table if exists animals"
mysql -h ${MYSQL_HOST} -u root -prooooot -D handson -e "create table animals (animal varchar(100));"

# aws s3 rm s3://mysql-dump-tkaburagi --recursive
nomad job stop -purge mysql_v5-7-28

sleep 30

curl -X PUT http://localhost:4646/v1/system/gc

rm -f mysql-backup/*
pkill vault
pkill consul
pkill nomad
