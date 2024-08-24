#!/bin/bash
user=$(cat /root/users.txt)
for i in $user;
do userdel -r $i
done;