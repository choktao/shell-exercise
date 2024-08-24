#!/bin/bash
i=0
sum=0
while [ $i -le 100 ]; do
    let sum+=$i
    let i++
done
echo "total:$sum"
