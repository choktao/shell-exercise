#!/bin/bash
function main_menu() {
   echo "=FTP 服务菜单="
   echo "1.安装服务"
   echo "2.管理服务"
   echo "3.Exit"

   read -p "请输入选择：" choice
   case "$choice" in
    1)
        function install_vsftpd() {
            echo "安装服务中"
            yum -y install vsftpd &> /dev/null
            echo "服务安装完毕"
        }
        install_vsftpd
    ;;
    2)
        function manage_vsftpd () {
            echo "=FTP 服务管理="
            echo "1.开启服务"
            echo "2.关闭服务"
            echo "3.检查状态"
            read -p "请输入选择：" choose
            case "$choose" in
                1)
                    systemctl enable --now vsftpd
                    echo "服务开启"
                ;;
                2)
                    systemctl stop vsftpd
                    echo "服务关闭"
                ;;
                3)
                    systemctl status vsftpd
                    echo "开始检查"
                ;;
                *)
                    echo "无效输入，请输入1-3"
                ;;
            esac
            
        }
        manage_vsftpd
    ;;
    3)
        echo  "退出脚本"
        exit
    ;;
    *)
        echo "无效输入，请输入1-3"
    ;;
   esac
   
}

main_menu
