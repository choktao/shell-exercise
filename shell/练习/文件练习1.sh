#!/bin/bash
#定义一个位置变量接受文件路径
file_path=$1
dir_path=$2
#定义一个时间戳变量
timestamp=$(date +%Y%m%d%H%M%S)
#创建一个备份文件夹
mkdir -p $dir_path
#备份文件
rsync -av $file_path $dir_path/bk_$timestamp_$file_path 