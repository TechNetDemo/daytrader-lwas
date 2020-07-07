# Daytrader Java App on OCP4

In this lab, we will deploy two-tier application on OCP4
- Daytrader Java App on WebSphere Liberty
- MySQL Database


Start OCP 4 Playground (OpenShift 4.2) - 60 mins

Go to `https://www.openshift.com/learn/courses/playground/`

Click `START SENARIO`

Go to `Console` tab

Login as `admin` / `developer`


# Hands on Lab

- [Setup Docker Network](#setup-docker-network)
- [Create Docker Volume](#create-docker-volume)
- [Deploy MySQL Container](#deploy-mysql-container)
- [Deploy Daytrader Container](#deploy-daytrader-container)
- [Monitoring](#monitoring)
- [DayTrader App Instruction](#daytrader-app-instruction)
- [Operational Process](#operational-process)
- [Test Docker Volume](#test-docker-volume)


## Create Openshift Project

Create Project `DayTrader`


## Deploy MySQL Database

Switch to Developer Portal

Press `Database`

Select `MySQL`

Press `Instantiate Template`

Input Template Information
- Database Service Name: `daytrader-mysql`
- MySQL Connection Username: `daytrader`
- MySQL Connection Password: `daytrader`
- MySQL root user Password: `admin`
- MySQL Database Name: `daytrader_db`


## Deploy DayTrader from Dockerfile

Pull MySQL Docker Image

    $ docker pull mysql:8.0.20


Deploy MySQL Container

    $ docker run -d --name daytrader-mysql --network br0 --publish 3306:3306 --volume daytrader-mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=daytrader_db -e MYSQL_USER=daytrader -e MYSQL_PASSWORD=daytrader mysql:8.0.20


Check Container by Docker Logs

    $ docker logs daytrader-mysql --follow
    
    
Display Running Processes of Container

    $ docker top daytrader-mysql


Enter MySQL container

    $ docker exec -it daytrader-mysql /bin/bash
    
    $ mysql -u root -p
    input password: admin
    $ show databases;
    $ exit
    $ exit


# DayTrader App Instruction

1. Open Web Browser and go to 


2. Go to "Configuration" Tab


3. Click "Configure DayTrader run-time parameters"

- Run-Time Mode: Direct (JDBC)
- DayTrader Max Users: 10
- Trade Max Quotes: 10 
- Press "Update Config"


4. Click "(Re)-create  DayTrader Database Tables and Indexes"


5. Click "(Re)-populate  DayTrader Database"


6. Go to "Trading & Portfolios" and Press "Login"


7. Click "Quotes/Trade"


8. Click "buy" on the first row


9. Click "quotes", then you can the volume increased by 100 on the first row.

