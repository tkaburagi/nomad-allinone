#!/bin/sh
FILE="go.mod"
if [ ! -e $FILE ]; then
    /usr/local/bin/go mod init front-go
    /usr/local/bin/go get github.com/labstack/echo
    /usr/local/bin/go build 
    cat go.mod
    # cp go.mod ../../../../../nomad-allinone/various-workload/front-go/go.mod
fi
# cat ../../../../../nomad-allinone/various-workload/front-go/go.mod
/usr/local/bin/go run /Users/kabu/hashicorp/nomad/nomad-allinone/various-workload/front-go/front-api.go