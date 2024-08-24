#!/bin/bash
#判断用户，关闭防火墙与selinux
[ $USER != "root" ]&&echo "请使用管理员操作"&&exit
yum -y remove firewalld &>/dev/null
setenforce 0
sed -i '/SELINUX/s/=.*/=disabled/' /etc/selinux/config
#根据不同点版本系统，修改命令历史记录，关闭交换分区
grep -qE "\s+8\.[0-9]" /etc/redhat-release
if [ $? -ne 0 ]; then
     # if body
     sed -ri 's/HISTSIZE=[0-9]+/HISTSIZE=0/' /etc/profile
else
     # else body
     sed -ri 's/HISTSIZE=[0-9]+/HISTSIZE=2000/' /etc/profile
     sed -i '/^export /i HISTTIMEFORMAT="%F %T"' /etc/profile
     swapoff -a
     sed -i '/swap/s/^/#/' /etc/fstab
fi
#定义ssh保持时间为300s，设置时间同步
echo "export TMOUT=300" >> /root/.bash_profile
yum -y install chrony
systemctl enable chrony
sed -ri '/^(pool|server).*iburst/s/^/#/' /etc/chrony.conf
sed -ri '1i server 192.168.88.1 iburst' /etc/chrony.conf
systemctl restart chrony