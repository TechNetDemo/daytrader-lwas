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

Click `Create Project`

Input the following information and press `Create` 
- Name: `DayTrader`
- Display Name: `DayTrader`


## Deploy MySQL Database

Switch to Developer Portal

Click `+Add`

Click `Database`

Select `MySQL`

Press `Instantiate Template`

Input the following information and press `Create`
- Database Service Name: `daytrader-mysql`
- MySQL Connection Username: `daytrader`
- MySQL Connection Password: `daytrader`
- MySQL root user Password: `admin`
- MySQL Database Name: `daytrader_db`


## Deploy DayTrader from Dockerfile

Click `+Add`

Click `From Dockerfile`

Input the following information and press `Create`
- Git Repo URL: `https://github.com/TechNetDemo/daytrader-lwas.git`
- `Show Advanced Git Options`
- Git Reference: `ocp4`
- Container Port: `9080`
- Application Name: `daytrader-app`
- Name: `daytrader-app`
- `Build Configuration`
- Press `Add from ConfigMap or Secret` 4 times
- name: `MYSQL_DAYTRADER_USER`-  resource: `daytrader-mysql` key: `database-user`
- name: `MYSQL_DAYTRADER_PASSWORD`-  resource: `daytrader-mysql` key:  `database-password`
- name: `MYSQL_DAYTRADER_DB`-    resource: `daytrader-mysql` key:  `database-name`
- name: `MYSQL_DAYTRADER_SERVICE`- resource: `mysql-persistent-parameters-<generated-string>`  key: `DATABASE_SERVICE_NAME`

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

