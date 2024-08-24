#!/bin/bash
#创建分区
#使用eof写入内容至fdisk命令
p_num=$1
if [ $p_num -ne 1..4 ];then
    echo '请输入分区编号'
    exit
fi
p_size=$2
if [ $p_size -lt 1 ];then
    echo '请输入分区大小'
    exit
fi
p_name=$3
#判断输入的分区是否存在
total_p=$(lsblk | awk '{print $1}')
grep $p_name <<< $total_p >/dev/null
if [ $? -ne 0 ];then 
    echo '分区不存在'
    exit
    fi  
block_parted(){
    fdisk $p_name <<EOF
    n
    $p_num
    $p_size
    w
    <<EOF
}

#分区格式化
block_format(){
    mkfs.xfs $p_name$p_num
}
#挂载分区
block_mount(){
    mkdir -p /data$p_num
    echo "$p_name$p_num /data$p_num xfs defaults 0 0" >> /etc/fstab
    mount -a
}

block_parted
block_format
block_mount


