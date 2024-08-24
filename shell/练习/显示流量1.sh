#!/bin/bash
#加入死循环
while :
do
    #截取流量数据
    data=$(cat /proc/net/dev | grep eth0 | awk '{print $10}')
    echo "发送流量：$data" 
    #加入sleep
    sleep 1
done