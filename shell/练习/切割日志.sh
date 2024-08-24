#!/bin/bash
#定义nginx日志路径
nginx_log=/usr/local/nginx/logs
#创建日志切割后存放的目录
mkdir /home/$USER/logs_bak
#截取日志大小保存到一个临时文件中
log_name=$(ls $nginx_log/*.log)
cd $nginx_log
for i in $log_name
do
    if [ -f $i ] ;then
        file_size=$(du -k $i | awk '{print $1}')
        if [ $file_size -gt 1000000 ];then
            sed -ir '1,10000d' $i >> /home/$USER/logs_bak/$i
        fi
    fi
done
