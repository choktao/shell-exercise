#!/bin/bash
#判断用户是否为root
if [ $UID -ne 0 ] ; then
    echo "请使用root用户进入"
    exit
fi
#关闭防火墙和selinux
systemctl stop firewalld
systemctl disabled firewalld
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
#判断系统版本
egrep -q '/\s+8\.[0-9]/' /etc/redhat-release
if [ $? -ne 0] ; then
    #判断为7版本
    #关闭命令历史记录
    sed -ri '/HISTSIZE/s/[0-9]+/0' /etc/profile
else
    #判断为8版本
    #命令历史记录保存2000条并加上时间戳
     sed -ri '/HISTSIZE/s/[0-9]+/2000/' /etc/profile
     sed -i  '/^export/i HISTTIMEFORMAT="%F %T "' /etc/profile
    #关闭系统的交换分区
    swapoff -a
    sed -i '/swap/s/^/#/' /etc/fstab
fi
#设置ssh保持时间为300s
    echo "export TMOUT=20" >> /root/.bashrc
#设置时间同步，ntp服务器地址是192.168.88.1
yum -y install chrony &> /dev/null
systemctl enable chronyd --now
sed -ri '/^pool|^server/s/^/#/' /etc/chrony.conf
sed -ri '1i server 192.168.88.1 iburst' /etc/chrony.conf
systemctl restart chronyd