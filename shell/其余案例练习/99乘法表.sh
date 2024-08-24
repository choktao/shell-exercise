#!/bin/bash
for ((i=0;i<=9;i++)) do
    echo $i
    for ((j=0;j<=9;j++)) do
        echo "$i*$j=$[i*j]"
    done
done