#!/bin/bash
x=$(awk '/^[a-zA-Z]/&&!/ycj$/{print NR}' user.txt)
#当x为空值时即已创建完毕，用if判断
if [ -z "$x" ] ; then
    echo "没有用户要创建"
    exit
fi
for i in $x
do
    #获取随机密码
    pass=$(tr -cd '_a-zA-Z0-9' < /dev/urandom | head -c 8)
    sed -i "${i}s/$/\t$pass/" user.txt
    read name pass << EOF
    $(sed -n "${i}p" user.txt)
EOF
    useradd $name
    echo $pass | passwd --stdin $name
    sed -i "${i}s/$/ ycj/" user.txt
done
column -t user.txt