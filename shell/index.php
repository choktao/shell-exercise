[root@web1 ~]# vim /usr/local/nginx/html/index.php
<?php
for ($i = 0; $i < 1000; $i++)
{
   for ($j=1; $j <=1000; $j++)
   {
    $x = $i*$j;
   }
}
echo date('Y-m-d H:i:s')."----:#### web1 ####<br>";
echo date('Y-m-d H:i:s')."----:#### web1 ####<br>";
?>