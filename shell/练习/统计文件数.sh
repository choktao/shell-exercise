#!/bin/bash
log=$(ls /var/log)
for i in $log
do
    echo $i 
done
echo $( ls /var/log| wc -l)