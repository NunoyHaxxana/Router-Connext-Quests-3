#!/bin/bash

#0. install mysql-server
echo -e "\e[1m\e[32mInstall mysql-server ... \e[0m" && sleep 1
apt-get update && apt-get upgrade -y
apt-get install mysql-server -y
systemctl start mysql.service


#1. Download the Zabbix and install
echo " "
echo -e "\e[1m\e[32mDownload the Zabbix and install ... \e[0m" && sleep 1
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
apt -y update

#2. Install Zabbix server, frontend, agent
echo " "
echo -e "\e[1m\e[32mInstall Zabbix server, frontend, agent ... \e[0m" && sleep 1
apt -y install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent

#3. Create initial database.
echo " "
echo -e "\e[1m\e[32mCreate initial database ... \e[0m" && sleep 1
mysql -u root -e "create database zabbix character set utf8mb4 collate utf8mb4_bin"; 
mysql -u root -e "create user zabbix@localhost identified by 'password'";
mysql -u root -e  "grant all privileges on zabbix.* to zabbix@localhost";


#4. Install the zabbix database.
echo " "
echo -e "\e[1m\e[32mInstall the zabbix database. ... \e[0m" && sleep 1
zcat /usr/share/doc/zabbix-sql-scripts/mysql/server.sql.gz | mysql -u zabbix -ppassword --database=zabbix


#5. Configure the database for Zabbix server
echo " "
echo -e "\e[1m\e[32mConfigure the database for Zabbix server ... \e[0m" && sleep 1
echo DBPassword=password >> /etc/zabbix/zabbix_server.conf

#6. Start Zabbix server and agent processes
echo " "
echo -e "\e[1m\e[32mDStart Zabbix server and agent processes ... \e[0m" && sleep 1
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2

#7. Install zabbix-agent2
echo " "
echo -e "\e[1m\e[32mInstall zabbix-agent2 ... \e[0m" && sleep 1
apt -y install zabbix-agent2


#8. Setup agent2 config
echo " "
echo -e "\e[1m\e[32mSetup zabbix-agent2 ... \e[0m" && sleep 1
cp /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agent2.conf.bak
mkdir $HOME/zabbix && cd $HOME/zabbix
curl -s ifconfig.co > $HOME/zabbix/ip.txt
hostname > $HOME/zabbix/hostname.txt
sed -i 's/Server=127.0.0.1/'Server=$(cat $HOME/zabbix/ip.txt)'/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/ServerActive=127.0.0.1/'ServerActive=$(cat $HOME/zabbix/ip.txt)'/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/Hostname=Zabbix server/'Hostname=$(cat $HOME/zabbix/hostname.txt)'/g' /etc/zabbix/zabbix_agent2.conf
echo ListenPort=10055 >> /etc/zabbix/zabbix_agent2.conf
chmod 775  /var/run/docker.sock
sudo usermod -aG docker zabbix
sudo systemctl restart zabbix-agent2
sudo systemctl enable zabbix-agent2

#9. Detail for add server on zabbix
echo " "
echo -e "\e[1m\e[32mYour Hostname for zabbix: $(cat $HOME/zabbix/hostname.txt)\e[0m" && sleep 1
echo -e "\e[1m\e[32mYour IP Address for zabbix: $(cat $HOME/zabbix/ip.txt)\e[0m" && sleep 1
