#!/bin/bash
#检查当前系统用户
#是管理员则安装vsftpd，不是则提示
if [ $UID -eq 0 ]  ;then
    echo "当前用户是管理员"
    yum install vsftpd -y
else
    echo "当前用户不是管理员"
fi