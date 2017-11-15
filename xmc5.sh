#!/bin/bash
clear

echo '=================================================='
echo '-Minecraft原版服务端一键安装脚本 主脚本 v5.0_alpha1'
echo '------------------作者: +Clouds+------------------'
echo '-----------博客: https://tec4every1.com-----------'
echo '=============正在做一些初始化操作......============'

#检测及初始化
initialize(){
        echo '正在检测系统包管理器类型...'
        if [[ -f /etc/redhat-release ]]; then
                pkg="yum"
        elif cat /etc/issue | grep -q -E -i "debian"; then
                pkg="apt"
        elif cat /etc/issue | grep -q -E -i "ubuntu"; then
                pkg="apt"
        elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
                pkg="yum"
        elif cat /proc/version | grep -q -E -i "debian"; then
                pkg="apt"
        elif cat /proc/version | grep -q -E -i "ubuntu"; then
                pkg="apt"
        elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
                pkg="yum"
        fi
        echo "你的包管理器是 $pkg"
        
        if [ -e ~/xmcalreadyran ]; then
                echo '检测包管理器缓存更新...'
                $pkg update -y -q
        else
                echo '第一次启动,正在检测包管理器缓存更新及必要依赖安装情况...'
                $pkg update -y -q
                $pkg install screen git -y -q
        fi
        
        echo '正在检查安装脚本更新...
        git clone 
        echo '初始化完成!'
}
initialize

menu(){
        echo '输入数字并回车来执行选项。'
        echo '-------------------------------'
        echo '1.开始安装过程'
        echo '2.交互式编辑配置文件'
        echo '3.手动编辑配置文件'
        echo 
