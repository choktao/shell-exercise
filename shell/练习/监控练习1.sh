#!/bin/bash
#截取内存空间赋值变量
mem_size=$(free -h | awk 'NR==2{print $2}' | sed 's/Gi//')
#截取磁盘空间赋值变量
disk_size=$(df -hT | awk '/\/$/{print $5}'| sed 's/\G//')
#判断内存空间和磁盘空间是否达到报警值
if [ $mem_size -lt 500 -a $disk_size -lt 50 ] ;
then mail -e "内存空间和磁盘空间不足" root@localhost
fi
echo $mem_size
echo $disk_size