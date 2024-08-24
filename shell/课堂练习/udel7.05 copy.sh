#!/bin/bash
while read id pw
do
if [ -z $pw ] ; then
    continue
fi
userdel -r $id
done < /root/user.txt