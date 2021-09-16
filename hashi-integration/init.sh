#!/bin/sh

nomad job stop -purge ui-java
nomad job stop -purge api-golang
nomad job stop -purge mysql

sleep 30

curl -X PUT http://localhost:4646/v1/system/gc

rm -f mysql-backup/*
pkill vault
pkill consul
pkill nomad
