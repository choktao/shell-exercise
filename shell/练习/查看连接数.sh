#!/bin.bash
link=$(netstat -ant  |awk '{print $5}' |awk '{print $1}'|sort -nr |uniq -c)
echo $link