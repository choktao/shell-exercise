#!/bin/bash

# 定义备份相关目录
BACKUP_DIR="/opt/backup_data"
REMOTE_BACKUP_DIR="/backup"
WEB_DIR="/var/www/html"

# 定义远程服务器信息
REMOTE_SERVER="root@$1"

# 备份当前Web文件
update() {
    date=$(date +%Y-%m-%d)
    # 使用rsync代替cp，并排除.tmp文件
    rsync -avz --exclude "*.tmp" $WEB_DIR/ $BACKUP_DIR/

    # 创建tar归档文件
    tar_file="$BACKUP_DIR/web_file_$date.tar.gz"
    tar -zcf $tar_file $WEB_DIR/

    # 计算备份文件数量
    tar_num=$(ls $BACKUP_DIR/*.tar.gz 2>/dev/null | wc -l)
    
    if [ $tar_num -ge 5 ]; then
        # 如果备份文件数量达到5个，上传最新备份并删除旧备份
        scp $BACKUP_DIR/*.tar.gz $REMOTE_SERVER:$REMOTE_BACKUP_DIR
        rm -f $BACKUP_DIR/*.tar.gz
    fi
}

# 执行更新函数，并检查执行结果
update
if [ $? -eq 0 ]; then
    echo "任务成功"
else
    echo "任务失败"
fi