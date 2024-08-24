#!/bin/bash
#截取有随机数的变量
random=$[RANDOM%100+1]
#输出提示语,获取输入
while :
do
read -p "请输入一个数字：" num
#判断输入是否为空或不为数字
if [ -z $num || !-d $num];then 
    continue
elif [ $num -eq $random ];then
     echo "中了"
    break
elif [ $num -gt $random ];then
     echo "太大了"
     continue
else [ $num -lt $random ]
     echo "太小了"
    continue
fi
done
#判断随机数与输入的大小