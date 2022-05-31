![1500x500 monitor](https://user-images.githubusercontent.com/83507970/170909319-144b37ca-43d7-4d1e-97db-a3a7975a9f2f.png)

#  I propose to build a tool that would help: 
- Connext Router server & docker monitor with zabbix

# Discord handle: 
- Haxxana#5597

# Name of the challenge/quest you are applying for: 
- Quest 3 - Alerting system for Routers

# Briefly describe your project: 
- Developer shell script to install zabbix and auto config zabbix-agent for monitor docker and send alert to discord.
- Zabbix is ​​an Open Source IT Infrastructure Monitoring system that supports Server, Storage, Network, Security, and Virtualization monitoring. comprehensively within the organization And with experience in installing and developing add-ons for Zabbix, Zabbix is ​​able to complete any system monitoring solution at a much lower cost than other solutions.
- Complete every inspection
with the ability to monitor the operation of various systems Through the use of Agent, SSH and External Probe, Zabbix can be deployed to monitor hardware, software, application, process and many more. In addition, Zabbix has a number of Dashboard and Report screens available to monitor and track issues. that happens with the IT system 24×7 immediately
- Zabbix has no copyright restrictions. This makes it possible to monitor all devices with an unlimited number of IP Addresses and Sensors. It supports both internal use of Internet Service Provider, Cloud Provider, Enterprise Data Center and network system of medium to small business in its entirety.

# Detailed project proposal:
- Automate to install Mysql-server.
- Automate to install zabbix
- Automate to install zabbix-agent
- Automate to install zabbix-agent2
- Automate to create database access for zabbix
- Automate to setup zabbix config file.
- Setup zabbix Gui.
- Setup server for monitor
- Setup Alert to Discord.


# Project roadmap and milestones:
| No           | Task | Start date | End date |
| ------------ | :--------: | :--------: | :--------: |
| 1            | Developer script | 30 May|  02 June |
| 2            | Testing script | 02 June |  04 June |
| 3            | Demo with Connext user and get feedback| 04 June |  08 June |
| 4            | Improve with feedback| 08 June |  16 June |


# KPIs (how can we measure the success of your project?)
- Reduce time to setup zabbix.
- Auto send alarm to discord when docker-compose down
- Any user without unix command knowledge can use it.

# Your professional background:
- More than 7 years experience in network radio engineer.
- Main staff team from Contribution DAO thailand.

# Have you already worked on similar projects:
- Axelar for Mainnet validator.
- Subquery for Indexer.

---


### Requirements

- OS Ubuntu 18.04 or 20.04 
>:black_square_button: 8GB RAM<br>
>:black_square_button: 30GB Storage<br>
- Need Super user or root for run this script.



## Clone and Install Scripts

```

wget -q -O zabbixsetup.sh https://raw.githubusercontent.com/NunoyHaxxana/Router-Connext-Quests-3/main/zabbixsetup.sh && chmod +x zabbixsetup.sh && sudo /bin/bash zabbixsetup.sh
```

1) When install finish, You can watch the hostname and ip for add in zabbix.

Your Hostname for zabbix: connext-router

Your IP Address for zabbix: xxx.xxx.xxx.xxx 

![image](https://user-images.githubusercontent.com/83507970/171265133-03bebedf-030a-4b11-93ce-6169ea6ec50f.png)


2) Go to browser and insert ip-address from step 1. ``` xxx.xxx.xxx.xxx/zabbix ```

![page1](https://user-images.githubusercontent.com/83507970/171263786-ed9da25d-bc89-4328-b6ef-5bce583f9ab0.jpg)

