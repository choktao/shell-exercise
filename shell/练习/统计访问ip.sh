#!/bin/bash
awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' /var/log/httpd/access_log
#i是数组索引，ip[i] 是数组的值