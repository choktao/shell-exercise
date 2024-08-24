#!/bin/bash
#截取硬盘名称及大小
bl_size=$(lsblk |awk '{print $1 $4}')
echo $bl_size
#获取硬盘名称
read -p "请输入要创建逻辑卷的硬盘名称：" bl_name
if [ -z $bl_name ];then
    echo "硬盘名称不能为空"
fi
#创建默认名称卷组和逻辑卷
vg_name=myvg$bl_name
lv_name=mylv$bl_name
while :
do
read -p "请输入要创建逻辑卷的大小：" lv_size
if [ -z $lv_size ];then
    echo "逻辑卷大小不能为空"
else 
    vgcreate $vg_name $bl_name &> /dev/null
    lvcreate -L $lv_size -n $lv_name $vg_name &> /dev/null
    if [ $? -ne 0 ];then
        echo "创建失败,原因获取是空间不足"
        continue
    else
        echo "创建成功"
        break
fi
done
