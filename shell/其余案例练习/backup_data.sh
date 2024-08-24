#!/bin/bash
#1.备份/var/www/html 里面除了.tmp类型的所有文件到/opt/backup_data

#2.备份的文件名要带时间戳，打tar包，格式为web_file_年-月-日.tar.gz

#3.如果/opt/backup_data中备份的tar包凑齐5个之后，就都上传到目标服务器的/backup目录中并删除本地的这些tar包

#4.任务执行成功或失败都要给出提示信息

# update 函数：执行网站文件备份并根据需要将备份上传到远程服务器
# 参数：
#   $1: 远程服务器的用户名@IP地址
# 返回值：
#   无直接返回值，通过 $? 变量判断任务是否成功

# shellcheck disable=SC2120
update () {
    # 获取当前日期，格式为 YYYY-MM-DD
    date=$(date +%Y-%m-%d)

    # 复制 /var/www/html/ 下的所有文件到 /opt/backup_data/，排除 .tmp 文件
    cp /var/www/html/* --exclude /opt/backup_data/*.tmp /opt/backup_data/

    # 打包并压缩 /var/www/html/ 目录为 tar.gz 文件，文件名包含当前日期
    tar -zcf /opt/backup_data/web_file_$date.tar.gz /var/www/html/

    # 计算 /opt/backup_data/ 目录下 .tar.gz 文件的数量
    tar_num=$(ls /opt/backup_data/*.tar.gz | wc -l) 

    # 如果 .tar.gz 文件数量等于 5，则将最新备份上传到远程服务器并删除本地备份
    if [ $tar_num -eq 5 ]; then
        scp /opt/backup_data/*.tar.gz root@$1:/backup/  # 上传备份到远程服务器
        rm -rf /opt/backup_data/*.tar.gz                # 删除本地的 .tar.gz 文件
    fi
}

# 调用 update 函数
update

# 检查上一个命令（update 函数调用）的执行状态，如果成功则输出 "任务成功"，否则输出 "任务失败"
if [ $? -eq 0 ]; then
    echo "任务成功"
else
    echo "任务失败"
fi