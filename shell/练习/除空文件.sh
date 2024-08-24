#!/bin/bash
#筛选大小为0的文件
dir=$1
find $dir -type f -size 0k -exec rm -rf {} \;
if [ $? -eq 0 ];then
    echo "删除成功"
    exit
else
    echo "删除失败或目录不存在或不存在大小为0的文件"
fi