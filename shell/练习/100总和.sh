#!/bin/bash
#定义一个为0的初始数
num=0
#递归叠加初始数
for i in {1..100}
do
    num=$((num+i))
done
echo $num