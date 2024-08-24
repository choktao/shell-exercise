#!/bin/bash
tb_sh="#./test.sh"
if [ grep -q "^#!" $1];then 
sed -i '1i#!/bin/bash ' $1
fi