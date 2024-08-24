#!/bin/bash
#从用户获取3个整数
#设置一个临时变量用于存储最大值
mx=0
read -p '请输入3个整数：' n1 n2 n3
if [ $n1 -gt $n2 ];then
    mx=$n1
    n1=$n2
    n2=$mx
elif [ $n1 -gt $n3 ] ; then
    mx=$n1
    n1=$n3
    n3=$mx
elif [ $n2 -gt $n3 ] ; then
    mx=$n2
    n2=$n3
    n3=$mx
else
    mx=$3
    fi
echo $n1 $n2 $n3