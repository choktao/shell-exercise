#!/bin/bash
while :
do
df -h |awk '/\/$/{print "剩余空间"$4}'
free -h | awk '/^Mem/{print "剩余内存"$4}'
uptime |awk '{print "15分钟平均负载"$NF}'
awk 'END{print "服务器用户共计"NR}' /etc/passwd
who | awk 'END{print "服务器当前用户"NR}'
rpm -qa | awk 'END{print "软件包总数"NR}'
sleep 3
done