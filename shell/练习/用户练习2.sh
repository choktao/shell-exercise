#!/bin/bash
#用户名和密码由用户输入获取
#密码有默认值123456
pass=123456
while :
do
    read -p '请输入用户名：' user
    if [ -z $user ] ;then
        echo "用户名不能为空"
    fi
    tty > /dev/null
    read -p '请输入密码：' pass
    if [ -z $pass ] ;then
        echo "将设置默认密码123456"
    fi
    echo '用户创建成功'
    exit 0
done  
    