#!/bin/bash
user=$(sed -n '/bash$/s/:.*//p' /etc/passwd)
for i in $user 
do
pass=$(grep $i /etc/shadow)
pass=${pass#*:}
pass=${pass%%:*}
    echo "$i --> $pass" > /tmp/pass.txt
done
