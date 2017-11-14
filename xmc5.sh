#!/bin/bash

echo 'Minecraft原版服务端安装程序 v5.0_alpha1'
echo 'blog: https://tec4every1.com'
echo '作者: +Clouds+'
echo '=======正在做一些初始化操作......======='

check_sys(){
        if [[ -f /etc/redhat-release ]]; then
                pkg="centos"
        elif cat /etc/issue | grep -q -E -i "debian"; then
                pkg="debian"
        elif cat /etc/issue | grep -q -E -i "ubuntu"; then
                pkg="ubuntu"
        elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
                pkg="centos"
        elif cat /proc/version | grep -q -E -i "debian"; then
                pkg="debian"
        elif cat /proc/version | grep -q -E -i "ubuntu"; then
                pkg="ubuntu"
        elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
                pkg="centos"
        fi
        
        $pkg update -y -q
        $
