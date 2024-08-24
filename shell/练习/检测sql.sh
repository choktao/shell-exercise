#!/bin/bash
ss -lntpu | grep mysql
if [ $? -eq 0 ];then
    echo "sql is running"
    exit 0
    fi