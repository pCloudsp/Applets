#!/bin/bash
#Xtec Minecraft original server installer
#Design:+Clouds+_and_a_lot_of_classmate  Program:+Clouds+
#Version 4.0

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
	echo "java -Xmx$maxram -Xms32M -jar ~/minecraft_server.$version.jar nogui" > runmc.sh
	chmod a+x runmc.sh
	echo "eula=true" > eula.txt
	clear
	echo "Please enter the name you want for the op."
	read op
	echo $op > ops.txt
	clear
	echo "The 1st step setup success.Please Run Minecraft server with this following connamd:"
	echo "bash runmc.sh"
	echo "If your Minecraft server started successfully, re-run this program and select 2."
	exit
}

mcconfig(){
	clear
	cd ~
	sed -i 's/online-mode=true/online-mode=false/g' server.properties
	clear
	echo "Minecraft server setup success!"
	echo "Run it in a backward process, connect and play!"
	echo "Thanks for using this program!"
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
	echo "If you need install Minecraft server for the next step, select 1."
	mainmenu
}

instscr(){
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
	echo 'For screen help, type "screen --help".'
	exit
}

mainmenu(){
	clear
	echo "-----Minecraft Original server installer by +Clouds+-----"
	echo "-------------Version 4.0_dev1  Code:+Clouds+-------------"
	echo " "
	echo "Please choose a function to run it."
	echo "If you have a fully-empty server, please run function in the following order:"
	echo "3-1-2-4"
	echo " "
	echo "1.Install Minecraft server (The 1st step of setup Minecraft server)"
	echo "2.Setup config file (The 2nd step of setup Minecraft server)"
	echo "3.Install Java (If you do not have it)"
	echo "4.Install Screen (Required)"
	echo "---------------------------------------------------------"
	
	read menu
	case $menu in
		1)
			instmc;;
		2)
			mcconfig;;
		3)
			instjava;;
		4)
			instscr
	esac
}

mainmenu
