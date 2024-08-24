#!/bin/bash
user=$(cat /root/users.txt)
for i in $user;
do useradd $i
echo '123456' | passwd --stdin $i
done;