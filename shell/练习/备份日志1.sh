#!/bin/bash
#截取日志文件名变量
source_file=/var/log/*
#创建备份文件夹并赋值变量
touch /backup
bk=/backup
tar -czf $bk/$(date +%Y%m%d%H%M)tar.gz $source_file
#tar命令备份
