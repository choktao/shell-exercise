#!/bin/bash
#接受路径参数
file_path=$1
#判断是否存在目录
if [ -d $file_path ] ;then
    echo '参数ok'
    else
        echo '参数错误'
fi
#输出目录大小
total_size=$(ls -lhd $file_path | awk '{print $5}')
echo "目录大小为：$total_size"
