#!/bin/bash
while
read id pw 
do
[ -z $pw ]&&continue
useradd $id
echo $pw | passwd --stdin $id
done < /home/yui/test/user.txt