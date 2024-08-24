#!/bin/bash
u=$(sed -n '/bash$/s/:.*//p' /etc/passwd)
for i in $u
do
pass=$(grep $i /etc/shadow | awk -F: '{print $2}')
echo "$i-->$pass"
done
