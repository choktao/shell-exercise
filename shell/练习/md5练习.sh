#!/bin/bash
#获取文件名保存变量
read -p "请输入绝对路径文件名：" filename
if [ !-f $filename ];then
    echo "文件不存在"
    exit 1
    fi
#保存md5值至一个文件
md5sum $filename >> /mnt/md5.txt
#读取md5.txt文件上一次的md5值
lastmd5=$(tail -2 /mnt/md5.txt | head -1)
if [ $md5sum != $lastmd5 ];then 
    echo "文件被修改"
    exit 1
    fi

