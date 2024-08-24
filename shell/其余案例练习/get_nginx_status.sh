#!/bin/bash
case $1 in
active)
    curl -s http://192.168.88.100/status | awk '/Active/{print $NF}'
;;
accept)
    curl -s http://192.168.88.100/status | awk '/Waiting/{print $NF}'
;;
waiting)
    curl -s http://192.168.88.100/status | awk 'NE==3{print $1}'
;;
esac