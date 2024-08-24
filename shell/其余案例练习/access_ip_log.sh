#!/bin/bash
log=/var/log/nginx/access.log
access_ip_log(){
    awk '{ip[$1]++}END{for(i in ip){print i"共计次数",ip[i]}}'  $log | sort -nr
}
access_ip_log   