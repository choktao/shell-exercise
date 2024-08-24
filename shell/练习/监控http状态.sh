#!/bin/bash
while :
do
snum=$(curl -s -o /dev/null -w "%{http_code}\n" $1 | tail -1)
if [ $snum -ne 200 ];then
    echo "$(date +%Y-%m-%d_%H:%M:%S)  $snum" >> /tmp/http_status.log
    echo "服务器状态异常"
else 
    echo "服务器正常"
fi
sleep 5
done