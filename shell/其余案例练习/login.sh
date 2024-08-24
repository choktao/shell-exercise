#!/bin/bash
u=$(sed -n '/bash$/s/:*//p' /etc/passwd)
for i in $u 
do 
    pass=$(grep $i /etc/shadow)
    pass=${pass#*:}
    pass=${pass%%:*}
    echo "$i --> $pass"
    
done
