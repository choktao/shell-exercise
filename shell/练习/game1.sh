#!/bin/bash
#包，石头，剪刀转换为0,1,2
#获取用户输入

pc=$(($RANDOM%3))
read -p "请输入你的选择：" choice
if [ $choice == "石头" ] ;then
choice=0
elif [ $choice == "剪刀" ] ;then
choice=1
else
choice=2
fi
case $choice in
    0)#石头
      if [ $choice -eq $pc ] ;then
      echo "平局"
      elif [ $choice-1 -gt $pc ] ;then
      echo "你赢了"
      else
      echo "你输了"
      fi
    ;;
    1)#剪刀
    if [ $choice -eq $pc ] ;then
        echo "平局"
    elif [ $choice -lt $pc ] ;then
        echo "你输了"
        else 
        echo "你赢了" 
    fi
    ;;
    2)#布
    if [ $choice -eq $pc ] ;then
        echo "平局"
        elif [ $choice+1 -lt $pc ] ;then
        echo "你赢了"
        else    
        echo "你输了"
    fi
    ;;
    exit)
    ;;
esac
