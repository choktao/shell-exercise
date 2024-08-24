#!/bin/bash
while read id pw
do
if [ -z $pw ] ; then
    continue
fi
useradd $id
echo $pw | passwd --stdin $id
done < /root/user.txt