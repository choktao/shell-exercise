#!/bin/bash
#判断当前账户身份
[ $UID -ne 0 ] && exit 
setenforce 0
sed -nir '/SELINUX/s/enforcing/disabled/' /etc/selinux/config
yum -y remove firewalld &> /dev/null
#判断系统版本
sed -n '/8.*/' /etc/redhat-release
if [ $? -eq 0 ] ; then
    #判断为8版本.修改命令历史记录2000条并加上时间戳
    sed -ri 's/HISTSIZE=.*$/HISTSIZE=2000/' /etc/profile
    sed -ri '/^export/s/HISTTIMEFORMAT="%F %T "' /etc/profile
    swapoff -a
    sed -i '/swap/d' /etc/fstab
else
    #判断为7版本,关闭命令历史记录
    sed -ri 's/HISTSIZE=.*$/HISTSIZE=0/' /etc/profile
fi
#设置ssh超时时间与时间同步
echo "export TMOUT=300" >> /root/.bashrc
yum -y install chrony &> /dev/null
systemctl enable chronyd -now
sed -ri '/^(pool|server)/d' /etc/chrony.conf
sed -ri '1i server 192.168.88.1 iburst' /etc/chrony.conf
systemctl restart chronyd