#!/bin/bash
color () {
    echo -e "\033[${1}m${2}\033[0m"
}

case $1 in 
start|kai)
    /usr/local/nginx/sbin/nginx &> /dev/null
    ss -lntpu | grep :80
;;
stop|guan)
    /usr/local/nginx/sbin/nginx -s stop
;;
restart|cq)
    /usr/local/nginx/sbin/nginx -s stop
     /usr/local/nginx/sbin/nginx &> /dev/null
    ss -lntpu | grep -q :80
    if [ $? -eq 0 ] ;then
        color 33 "nginx运行成功"
    else
        color 35 "nginx运行失败"
    fi
;;
*)
    echo "请输入start|stop"
;;
esac