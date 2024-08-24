#!/bin/bash
vct=0
lct=0
for i in {1..10}
do
    ping -c 3 -i 0.2 -w 1 192.168.88.$i &> /dev/null
    if [ $? -eq 0 ]; then
        echo "88.$i is ok"
        let vct++
    else
        echo "88.$i is no"
        let lct++
    fi
done
echo "vct:$vct"
echo "lct:$lct"