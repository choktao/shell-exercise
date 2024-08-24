#!/bin/bash
#需要一个user.txt文件,里面包含姓名
#获取行数
num=$(awk 'END{print NR}' user.txt)
ran=$(($RANDOM%$num+1))
sed -n "${ran}p" user.txt