#!/bin/bash
#显示sql连接数
mysql -u$1 -p$2 -e "show processlist;" | wc -l