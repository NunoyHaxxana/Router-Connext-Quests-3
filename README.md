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

---

#  Step 1. Clone and Install Scripts

```

wget -q -O zabbixsetup.sh https://raw.githubusercontent.com/NunoyHaxxana/Router-Connext-Quests-3/main/zabbixsetup.sh && chmod +x zabbixsetup.sh && sudo /bin/bash zabbixsetup.sh
```

When finished install, Please note output for use in next step.
![image](https://user-images.githubusercontent.com/83507970/171499839-06452f9d-e78f-415e-ae55-79c9483849f1.png)


```
Your Hostname for zabbix: xxxxxxx
Your IP Address for zabbix: xx.xx.xx.xx
Your Zabbix DB Password: xxxxxxxxxxxxxx
```
---

#  Step 2: Zabbix Web Config.
Go to browser insert ip address which must from step 1.

```
http://IP-Address-for-zabbix/zabbix
```
![image](https://user-images.githubusercontent.com/83507970/171500320-515c39a5-0fbd-44bd-bafd-b708d7aa6d71.png)
Click Next step.



Input Zabbix DB Password which must from step 1. to Password field.
![image](https://user-images.githubusercontent.com/83507970/171500352-74d8cb00-00cf-47fa-bae8-b4a13bd133cb.png)




Your can input Zabbix server name you like.
![image](https://user-images.githubusercontent.com/83507970/171500404-32ccb5ee-9843-4dc5-a8ca-5c47dbd29d41.png)
Click Next step.

![image](https://user-images.githubusercontent.com/83507970/171500424-d45811c3-02d7-4613-bdc1-6a9f7e166f39.png)
Click Finish.

---

# Step 3: Zabbix Web.
To monitor a remote host, you need to add it to the Zabbix server’s dashboard via a browser. Zabbix provides myriad templates for various services and applications. We will link the appropriate template to the Docker host to specifically monitor containers. But first, access the Zabbix server’s login page.

```
User: Admin 
Pass: zabbix
```

![image](https://user-images.githubusercontent.com/83507970/171500523-aba9450f-b773-491f-b451-a674ad08f396.png)


Once you have logged in, navigate to the right sidebar and click on ```Configuration``` then ```Hosts```. and At the far top-right corner,
click on ```Create host```.

![image](https://user-images.githubusercontent.com/83507970/171500549-51b321e5-7447-4c80-8d51-dab29d79bd57.png)



Fill in the details of the Docker server such as the hostname name. For Groups, Type in ```Connext``` (every host must be associated with a group).

Fill in the details of the Templates specify ```Docker by Zabbix agent 2``` and ```Linux by Zabbix agent```

Below the ‘Interfaces’ label click on ‘Add’ and in the menu that appears select ‘Agent’. Next, fill out the server’s private IP address from step 1. and ensure that the port is set to 10055.

![image](https://user-images.githubusercontent.com/83507970/171500628-252867fc-55db-49e0-bc04-07479beeec3f.png)


Add Docker Server to Zabbix
Now head back to the Zabbix server dashboard. Click on ‘Monitoring’ then ‘Hosts’. Click on the name of your Docker server and in the menu option that appears, select ‘Dashboards’.

![image](https://user-images.githubusercontent.com/83507970/171500649-b47d6ee4-ebd9-4348-bb66-ebd0fe4e04c5.png)


After a few minutes, the Zabbix server will detect the container and start populating some statistics.
![image](https://user-images.githubusercontent.com/83507970/171500660-13c28872-04c3-4f52-8e9f-fbab1163e9d8.png)


You can also view the graphs of the various server metrics by clicking on the ‘Dashboard’ options of the ‘System performance’ page. Below you can see the CPU & Memory usage metrics.
![image](https://user-images.githubusercontent.com/83507970/171500678-267bbca5-4b13-47db-b616-74e7f7e4d1b3.png)


Now head back to the Zabbix server dashboard. Click on ‘Monitoring’ then ‘Hosts’. Click on the name of your Docker server and in the menu option that appears, select ‘Latest data’.
![image](https://user-images.githubusercontent.com/83507970/171500695-48c8b3af-8857-4fa6-badc-b0f78cadeeeb.png)


Click on ‘container’
![image](https://user-images.githubusercontent.com/83507970/171500708-ed8076ac-c4e9-4fac-9a1d-0414c9783b42.png)


You can also view the graphs of the various container metrics by clicking on the ‘graphs’ options of the Docker server on the ‘Hosts’ page. Below you can see the CPU & Memory usage metrics.
![image](https://user-images.githubusercontent.com/83507970/171500733-325934bd-1296-4a2d-901f-b0333117b846.png)

---

# Step 4: Set Alert to Discord
Setting up Discord Webhook
1. Go to https://discordapp.com/app or open Discord Desktop application. Select your server and channel where you want to get Zabbix notifications.

2. Press Edit channel, select Integrations tab and press Create Webhook button
![image](https://user-images.githubusercontent.com/83507970/171500746-1f5a0ba1-46e2-4633-80aa-9f9b11205abe.png)


3. Setup your Discord webhook and press Save.
You can copy Discord webhook URL now or view it later by clicking on Edit button.
![image](https://user-images.githubusercontent.com/83507970/171500774-385c4b1b-99a1-4cc2-bba5-efb019906be9.png)



4. Setting up Zabbix Webhook
Now head back to the Zabbix server dashboard. Click on ‘Administration’ then ‘General’. Click on the name of menu ‘Macros’.
![image](https://user-images.githubusercontent.com/83507970/171500786-d511847f-acad-49f9-9425-615e92596f0d.png)


You need to setup the global macro “{$ZABBIX.URL}”, which must contain the URL to the Zabbix frontend.
The URL should be either an IP address, a fully qualified domain name or localhost. Specifying a protocol is mandatory, whereas port is optional.
http://xx.xx.xx.xx/zabbix/
![image](https://user-images.githubusercontent.com/83507970/171500807-2b12ff1b-2e09-4ee6-984d-0429b2b4a62c.png)

---

# Step 5: Setting up Discord Function
Now head back to the Zabbix server dashboard. Click on ‘Administration’ then ‘Media types’. Click on the name of menu ‘Discord’.
![image](https://user-images.githubusercontent.com/83507970/171500830-72408cd2-3a7e-4208-8a4a-d4d7e7be194a.png)



You need to setup the Parameters “discord_endpoint”, which must contain the URL from Your discord Webhook. and update
![image](https://user-images.githubusercontent.com/83507970/171500843-3085ef57-4ed6-4a8f-9f1b-8880470a9929.png)



# Step :6 Setting up User Alert
Now head back to the Zabbix server dashboard. Click on ‘Administration’ then ‘User’. Click on the Username ‘Admin’.
![image](https://user-images.githubusercontent.com/83507970/171500864-06018ac2-4873-4f6b-882d-2cc0e4f997f9.png)

![image](https://user-images.githubusercontent.com/83507970/171500879-f7dc7493-872c-4528-9f82-81e5659a9d20.png)



You need to choose the Type ```Discord```, and setup the ```Send to``` which must contain the URL from Your discord Webhook. and Add
![image](https://user-images.githubusercontent.com/83507970/171500896-bcfd0634-2e90-4262-8829-836a4b60d063.png)
![image](https://user-images.githubusercontent.com/83507970/171500947-75ee3765-319b-4e92-b510-13807053099e.png)
Click Update

---

# Step 7 : Setting up Tigger Alert
Now head back to the Zabbix server dashboard. Click on ```Configuration``` then ```Action```. Click on the menu ```Trigger actions```. and Click on the menu
![image](https://user-images.githubusercontent.com/83507970/171500973-602e1222-9820-45be-832e-63e1f0da74d6.png)



You need to setup the Name ```Discord Alarm”```
![image](https://user-images.githubusercontent.com/83507970/171500992-4ab145b4-cdf8-4192-875a-17cf7f9f798b.png)


Click on ```Operations```
You need to setup the Operations Click on ```Add```
![image](https://user-images.githubusercontent.com/83507970/171501006-03fac1bf-0072-4651-becf-c5098a8d7f41.png)

![image](https://user-images.githubusercontent.com/83507970/171501021-ee091bae-b54b-46ec-a396-7e49390d5396.png)



You need to setup the Parameters which must contain
Send to user groups which must contain : ```Zabbix administrators```
Send to users which must contain : ```Admin```
Send only to which must contain : ```Discord```

Make sure your setup all both
- Operations
- Recover operations
- Update operations
![image](https://user-images.githubusercontent.com/83507970/171501048-6582e164-478b-4ff2-a696-b7180c977d2c.png)



Click Add

---

# Step 8: Test Alarm and Alert to Discord

### Test with down docker.
![image](https://user-images.githubusercontent.com/83507970/171501067-03de47fd-1d20-4407-8879-849b228ee883.png)
On zabbix alarm show docker stopped

![image](https://user-images.githubusercontent.com/83507970/171501086-6117c700-cd99-42b1-b195-2d353cea2338.png)
Alert Problem send to discord



### Test with Start docker.

![image](https://user-images.githubusercontent.com/83507970/171500162-456b834c-1f66-4100-a712-76075ca177de.png)
On zabbix show alarm Resolved

![image](https://user-images.githubusercontent.com/83507970/171500141-a4f358f7-68b2-473b-bdee-d530104ad0e0.png)
Alert Recovery send to discord
