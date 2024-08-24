#!/bin/bash
#使用mysqldump命令备份数据库
#备份单个表
bk_table(){
    read -p "请输入要备份的表名（库 表）：" tbname
    read -p "请输入数据库用户和密码（用户 密码）：" dbuser dbpwd
    if [  -z $tbname ];then
        echo "表名不能为空"
        exit
        fi
    mysqldump -u$dbuser -p$dbpwd $tbname > $tbname.sql
}
#备份单个库
bk_db(){
    read -p "请输入要备份的库名：" dbname
    read -p "请输入数据库用户和密码（用户 密码）：" dbuser dbpwd
    if [  -z $dbname ];then
        echo "库名不能为空"
        exit
        fi
    mysqldump -u$dbuser -p$dbpwd -B $dbname > $dbname.sql
}
#全部备份
bk_all(){
    read -p "请输入数据库用户和密码（用户 密码）：" dbuser dbpwd
    mysqldump -u$dbuser -p$dbpwd -A > $date.sql
}
#菜单
menu(){
    echo "1.备份单个表"
    echo "2.备份单个库"
    echo "3.备份全部库"
    read -p "请输入要备份的类型(1-3)：" type
    case $type in
    1)
    bk_table
    ;;
    2)
    bk_db
    ;;
    3)
    bk_all
    ;;
    *)
    echo "输入错误"
    exit
    esac
}
menu