#!/bin/bash
#Xtec Minecraft original server installer
#Design:+Clouds+_and_a_lot_of_classmate  Program:+Clouds+
#Version 4.0_beta3

instmc(){
	clear
	echo "Please enter the version of Minecraft server youwant to install."
	echo "e.g. 1.12"
	read version
	cd ~
	wget http://s3.amazonaws.com/Minecraft.Download/versions/$version/minecraft_server.$version.jar
	chmod a+x minecraft_server.$version.jar
	clear
	echo "Please enter the MAX memory size you want for your Minecraft server."
	echo "Example:512M"
	read maxram
	echo "java -Xmx$maxram -Xms32M -jar ~/minecraft_server.$version.jar nogui" > runmc.shserv
	chmod a+x runmc.sh
	echo "eula=true" > eula.txt
	clear
	echo "Minecraft server setup success!"
	echo "Run it in a backward process, connect and play!"
	echo "To enable cheat, please set your account to the op menually from your server."
	echo 'If you are not a genuine user, please use "bash runmc.sh" to run server the first time, exit it, re-run this program and select 4.'
	echo "Thanks for using this program!"
	exit
}
mcconfig(){
	clear
	cd ~
	sed -i 's/online-mode=true/online-mode=false/g' server.properties
	clear
	exit
}
instjava(){
	if [[ -f /etc/redhat-release ]]; then
	 yum update -y
	elif cat /etc/issue | grep -q -E -i "debian"; then
	 apt-get update -y
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
	 apt-get update -y
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
	 yum update -y
	elif cat /proc/version | grep -q -E -i "debian"; then
	 apt-get update -y
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
	 apt-get update -y
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
	 yum update -y
	fi

	if [[ -f /etc/redhat-release ]]; then
	 yum install java-1.8.0-openjdk -y
	elif cat /etc/issue | grep -q -E -i "debian"; then
	 apt-get install default-jre -y
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
	 apt-get install default-jre -y
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
	 yum install java-1.8.0-openjdk -y
	elif cat /proc/version | grep -q -E -i "debian"; then
	 apt-get install default-jre -y
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
	 apt-get install default-jre -y
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
	 yum install java-1.8.0-openjdk -y
	fi
	sleep 1
	clear
	echo "Java installed successfully!"
	mainmenu
}
instscr(){
	if [[ -f /etc/redhat-release ]]; then
	 yum install screen -y
	elif cat /etc/issue | grep -q -E -i "debian"; then
	 apt-get install screen -y
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
	 apt-get install screen -y
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
	 yum install screen -y
	elif cat /proc/version | grep -q -E -i "debian"; then
	 apt-get install screen -y
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
	 apt-get install screen -y
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
	 yum install screen -y
	fi
	sleep 1
	clear
	echo "Screen installed successfully!"
	echo 'If you don't know how to use this, run "screen --help" or explore Xtec to get help.'
	mainmenu
}
mainmenu(){
	clear
	echo "-----Minecraft Original server installer by +Clouds+-----"
	echo "-------------Version 4.0_dev1  Code:+Clouds+-------------"
	echo "Please choose a function to run it."
	echo "If you have a fully-empty server, just run functions like 1-2-3-4."
	echo " "
	echo "1.Install Java (If you do not have it)"
	echo "2.Install Screen (Required because MC Server need to be a backward process)"
	echo "3.Install Minecraft server (The 1st step of setup Minecraft server)"
	echo "4.Allow Offline user (Optional)"
	echo " "
	echo "---------------------------------------------------------"
	read menu
	case $menu in
		1)
			instjava;;
		2)
			instscr;;
		3)
			instmc;;
		4)
			mcconfig
	esac
}
mainmenu
