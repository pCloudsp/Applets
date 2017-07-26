#!/bin/bash
#Minecraft original server installer by +Clouds+
#Copyright Xtec.tk all rights reserved.
#Version 3.1_dev3
source ~/.bashrc
clear
defaultpath=~/jre1.8.0_131/bin/java
if [[ -f /etc/redhat-release ]]; then
 pman="yum"
elif cat /etc/issue | grep -q -E -i "debian"; then
 pman="apt-get"
elif cat /etc/issue | grep -q -E -i "ubuntu"; then
 pman="apt-get"
elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
 pman="yum"
elif cat /proc/version | grep -q -E -i "debian"; then
 pman="apt-get"
elif cat /proc/version | grep -q -E -i "ubuntu"; then
 pman="apt-get"
elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
 pman="yum"
fi
if [ -f "$defaultpath" ]; then
 echo "You have java8-update131 downloaded from this program.Minecraft server now can install."
 jinst=~/jre1.8.0_131/bin/java
else
 echo "Maybe your java is not download from this program, or you totally didn't install java on your system at all.If you see "java:Command not found",please select "Install Java" first from the main menu of this program.Or if tou installed java on your system(like apt/yum/pacman), Set your java path first."
 java -version
fi
echo "-----Minecraft muiti-version server installer 3.1_dev3 by +Clouds+-----"
echo "Here is a list which version you can install from this program."
echo " "
echo "1  1.7.2"
echo "2  1.8.8"
echo "3  1.9.4"
echo "4  1.10.2 "
echo "5  1.11.2"
echo " "
echo "---------------------------Some Extra Options--------------------------"
echo "You might INSTALL SCREEN FIRST to run Minecraft server in background."
echo " "
echo "6  Install Java"
echo "7  Set Java path"
echo "8  Install Screen"
echo " "
echo "-----------------------------------------------------------------------"
read mainmenu

case $mainmenu in
    1)
    mkdir ~/xmc172
    cd ~/xmc172
    wget http://s3.amazonaws.com/Minecraft.Download/versions/1.7.2/minecraft_server.1.7.2.jar
    touch ~/launchmc172.sh
    clear
    echo "Please Enter the MAX memory size you want for the Minecraft Server."
    echo "[memory_size][M/G]"
    echo "Example:  "512M""
    read maxram
    echo $jinst -Xmx$maxram -Xms32M -jar ~/xmc172/minecraft_server.1.7.2.jar nogui >> ~/launchmc172.sh
    chmod +x ~/launchmc172.sh
    wget -O server.properties http://hhkx.tk/Xtec-Ext/InstallMinecraft/3/server.properties17
    clear
    echo "Please type in your account name HERE."
    echo "Your account name may be the first OP."
    read op
    echo $op >> ops.txt
    clear
    echo "Minecraft 1.7.2 Server installed successfully!"
    echo "Type "bash ~/launchmc172.sh" to launch your Minecraft server."
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    2)
    mkdir ~/xmc188
    cd ~/xmc188
    wget http://s3.amazonaws.com/Minecraft.Download/versions/1.8.8/minecraft_server.1.8.8.jar
    touch ~/launchmc188.sh
    clear
    echo "Please Enter the MAX memory size you want for the Minecraft Server."
    echo "[memory_size][M/G]"
    echo "Example:  "512M""
    read maxram
    echo $jinst -Xmx$maxram -Xms32M -jar ~/xmc188/minecraft_server.1.8.8.jar nogui >> ~/launchmc188.sh
    chmod +x ~/launchmc188.sh
    touch eula.txt
    echo "eula=true" >> eula.txt
    wget -O server.properties http://hhkx.tk/Xtec-Ext/InstallMinecraft/3/server.properties188
    clear
    echo "Please type in your account name HERE."
    echo "Your account name may be the first OP."
    read op
    echo $op >> ops.txt
    clear
    echo "Minecraft 1.8.8 Server installed successfully!"
    echo "Type "bash ~/launchmc188.sh" to launch your Minecraft server."
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    3)
    mkdir ~/xmc194
    cd ~/xmc194
    wget http://s3.amazonaws.com/Minecraft.Download/versions/1.9.4/minecraft_server.1.9.4.jar
    touch ~/launchmc194.sh
    clear
    echo "Please Enter the MAX memory size you want for the Minecraft Server."
    echo "[memory_size][M/G]"
    echo "Example:  "512M""
    read maxram
    echo $jinst -Xmx$maxram -Xms32M -jar ~/xmc194/minecraft_server.1.9.4.jar nogui >> ~/launchmc194.sh
    chmod +x ~/launchmc194.sh
    touch eula.txt
    echo "eula=true" >> eula.txt
    wget -O server.properties http://hhkx.tk/Xtec-Ext/InstallMinecraft/3/server.properties194
    clear
    echo "Please type in your account name HERE."
    echo "Your account name may be the first OP."
    read op
    echo $op >> ops.txt
    clear
    echo "Minecraft 1.9.4 Server installed successfully!"
    echo "Type "bash ~/launchmc194.sh" to launch your Minecraft server."
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    4)
    mkdir ~/xmc1102
    cd ~/xmc1102
    wget http://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar
    touch ~/launchmc1102.sh
    clear
    echo "Please Enter the MAX memory size you want for the Minecraft Server."
    echo "[memory_size][M/G]"
    echo "Example:  "512M""
    read maxram
    echo $jinst -Xmx$maxram -Xms32M -jar ~/xmc1102/minecraft_server.1.10.2.jar nogui >> ~/launchmc1102.sh
    chmod +x ~/launchmc1102.sh
    touch eula.txt
    echo "eula=true" >> eula.txt
    wget -O server.properties http://hhkx.tk/Xtec-Ext/InstallMinecraft/3/server.properties110
    clear
    echo "Please type in your account name HERE."
    echo "Your account name may be the first OP."
    read op
    echo $op >> ops.txt
    clear
    echo "Minecraft 1.10.2 Server installed successfully!"
    echo "Type "bash ~/launchmc1102.sh" to launch your Minecraft server."
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    5)
    mkdir ~/xmc1112
    cd ~/xmc1112
    wget http://s3.amazonaws.com/Minecraft.Download/versions/1.11.2/minecraft_server.1.11.2.jar
    touch ~/launchmc1112.sh
    clear
    echo "Please Enter the MAX memory size you want for the Minecraft Server."
    echo "[memory_size][M/G]"
    echo "Example:  "512M""
    read maxram
    echo nohup $jinst -Xmx$maxram -Xms32M -jar ~/xmc1112/minecraft_server.1.11.2.jar nogui >> ~/launchmc1112.sh
    chmod +x ~/launchmc1112.sh
    wget -O server.properties http://hhkx.tk/Xtec-Ext/InstallMinecraft/3/server.properties111
    touch eula.txt
    echo "eula=true" >> eula.txt
    clear
    echo "Please type in your account name HERE."
    echo "Your account name may be the first OP."
    read op
    echo $op >> ops.txt
    clear
    echo "Minecraft 1.11.2 Server installed successfully!"
    echo "Type "bash ~/launchmc1112.sh" to launch your Minecraft server."
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    6)
    cd ~
    wget -q http://hhkx.tk/Linux-all/jre-8u131-linux-i586.tar.gz
    tar -xzf jre-8u131-linux-i586.tar.gz
    rm jre-8u131-linux-i586.tar.gz
    chmod +x ~/jre1.8.0_131/bin/java
    clear
    echo "Java-8u131 installed successfully!"
    echo "Re-run this program and you can install minecraft server!"
    echo "To re-run, type "bash xmc3.sh"."
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    7)
    cd ~
    echo "Please set your java install path here."
    echo "If you installed java by apt/yum/pacman..., just type "java"."
    read jinst
    clear
    echo "Java path setup successfully!"
    echo "Re-run this program and you can install minecraft server!"
    echo "To re-run, type "bash xmc3.sh""
    echo "Thank you for support our project!"
    sleep 10
    exit;;
    8)
    echo "Installing screen, please wait..."
    $pman update
    $pman install screen -y
    clear
    echo "Screen installed successfully!"
    echo "Re-run this program and you can install minecraft server!"
    echo "To re-run, type "bash xmc3.sh""
    echo "Thank you for support our project!"
    sleep 10
    exit
esac
