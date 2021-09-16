#!/bin/sh
FILE="go.mod"
if [ ! -e $FILE ]; then
    /usr/local/bin/go mod init front-go
    /usr/local/bin/go get github.com/hashicorp/consul/api
    /usr/local/bin/go get github.com/jinzhu/gorm
    /usr/local/bin/go get github.com/jinzhu/gorm/dialects/mysql
    /usr/local/bin/go get github.com/ant0ine/go-json-rest/rest
    /usr/local/bin/go mod download golang.org/x/sys
    /usr/local/bin/go build 
    cat go.mod
fi
/usr/local/bin/go run /Users/kabu/hashicorp/nomad/nomad-allinone/hashi-integration/api.go