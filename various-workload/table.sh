#!/bin/sh

mysql -h ${MYSQL_HOST} -u root -prooooot -D handson -e "drop table if exists animals"
mysql -h ${MYSQL_HOST} -u root -prooooot -D handson -e "create table animals (animal varchar(100));"
