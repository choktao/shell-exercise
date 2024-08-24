#!/bin/bash
#显示基础菜单
base_menu() {
    echo "1.安装服务"
    echo "2.开启服务"
    echo "3.关闭服务"
    echo "0.退出"
    read -p "enter your choice" num
    case $num in
    1)
    #安装服务
    install_vsftpd (){
        echo "install start"
        yum - y install vsftpd &> /dev/null
        echo "install already"
    }
    install_vsftpd
    ;;
    2)
    #开启服务
    start_vsftpd (){
        echo "start service"
        systemctl enable vsftpd -- now &> /dev/null
        echo "start already and enabled"
    }
    start_vsftpd
    ;;
    3)
    off_vsftpd (){
        echo "stop service"
        systemctl stop vsftpd &> /dev/null
        systemctl disable vsftpd &> /dev/null
        echo "service already off"
    }
    ;;
    0)
    exit
    ;;
    *)
    echo "请输入1-3的数字"
    ;;
    esac
}
base_menu