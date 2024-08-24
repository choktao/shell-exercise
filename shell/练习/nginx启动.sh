#!/bin/bash
#定义nginx bin 路径
nginx_bin=/usr/local/nginx/sbin/nginx
pid=/usr/local/nginx/logs/nginx.pid
start(){
if [ -f $pid ];then
    echo "nginx is running"
    else
    $nginx_bin
fi
}
stop() {
    if [ -f $pid ];then
    echo "nginx is stop"
    else
    $nginx_bin -s stop
fi
}
status(){
    if [ -f $pid ];then
    echo "nginx is running"
    else
    echo "nginx is stop"
    fi
}
case $1 in 
stop)
    stop
;;
restart)
    stop
    sleep1
    start
;;
status)
    status
;;
esac