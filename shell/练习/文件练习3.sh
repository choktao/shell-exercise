#!/bin/bash
#显示系统相关信息
#系统时间
time=$(date)
#当前登陆用户
user=$(whoami)
#系统ip
sysip=$(ip a s |awk '/inet/{print $2}')

echo "系统时间：$time"
echo "当前登陆用户：$user"
echo "系统ip：$sysip"