#!/bin/bash

# 从文件/home/yui/user.txt中读取用户名称和密码，为每个非空密码的用户创建新用户并设置密码
while
    read n p
do
    # 如果密码为空（即$p等于0），则跳过当前循环，不创建用户
    [ $p -eq 0 ] && continue
    # 使用read命令读取的用户名$n创建新用户
    useradd $n
    # 将读取的密码设置为新用户的密码
    echo $n  | paswd --stdin $n
done < /home/yui/user.txt