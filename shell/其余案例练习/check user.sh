#!/bin/bash
# shellcheck disable=SC2002
u=$(cat /etc/passwd | wc -l)
if [ $u -gt 46 ]; then
     # if body
     echo "useradd" | mail -s test root
fi
