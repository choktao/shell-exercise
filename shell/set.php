<?php
$redis_list = ['192.168.88.51:6379','192.168.88.52:6379','192.168.88.53:6379','192.168.88.54:6379','192.168.88.55:6379','192.168.88.56:6379'];
$client = new RedisCluster(NUll,$redis_list);
$client->set("i","tarenaA ");
$client->set("j","tarenaB ");
$client->set("k","tarenaC ");
echo "save ok\n";
?>