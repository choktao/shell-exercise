#!/bin/bash

# 定义一个进度条函数
function progress_bar() {
    while [ "$stop_progress" != "true" ]; do
        echo -n '#'
        sleep 0.2
    done
}

# 注册信号处理函数
function cleanup {
    stop_progress=true
    kill $progress_pid 2>/dev/null
}

# 在退出时调用cleanup函数
trap cleanup EXIT

progress_bar &  # 后台启动进度条
progress_pid=$!  # 记录进度条的PID

# 任意执行一个命令
echo '测试命令'

# 等待命令执行完毕
stop_progress=false

# 确保进度条被优雅地终止
cleanup

echo '测试完成'