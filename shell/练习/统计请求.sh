#!/bin/bash
#时间条件为13:30-14:30
awk -F "[/:]" '$7":"$8 >= "13:30" && $7":"$8 <= "14:30" {print $1}' /var/log/httpd/access_log 