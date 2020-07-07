# Daytrader Java App on Websphere Liberty and MySQL Container

Please clone this git repository to your local machine with installed docker engine / docker toolbox

- [Setup Docker Network](#Setup Docker Network)
- [Create Docker Volume](#Create Docker Volume)
- [Create MySQL Container](#Create MySQL Container)
- [Create Daytrader with Websphere Liberty Container](#Create Daytrader with Websphere Liberty Container)
- [Verification](#Verification)
- [DayTrader App Instruction](#DayTrader App Instruction)


# Setup Docker Network

1. Create Docker Network for Two Tier App
  
  docker network create --driver=bridge --subnet=192.168.0.0/24 br0


2. Show Docker Network

$ docker network ls


# Create Docker Volume

1. Create Docker Volume for MySQL Container

$ docker volume create daytrader-mysql-volume


2. Show Docker Volume

$ docker volume ls


# Create MySQL Container

1. Pull MySQL Docker Image

$ docker pull mysql:8.0.20


2. Run MySQL Container

$ docker run -d --name daytrader-mysql --network br0 --publish 3306:3306 --volume daytrader-mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=daytrader_db -e MYSQL_USER=daytrader -e MYSQL_PASSWORD=daytrader mysql:8.0.20


3. Check Container by Docker Logs

$ docker logs daytrader-mysql --follow


4. Enter MySQL container

$ docker exec -it daytrader-mysql /bin/bash

$ mysql -u root -p

$ show databases;

$ exit

$ exit


# Create Daytrader with Websphere Liberty Container

1. Build Docker Image with Application and Configurations

$ docker build -t l-was/daytrader:1.0 .


2. Run Container with Custom Image

$ docker run -d --name daytrader --network br0 -p 9080:9080 -p 9443:9443 l-was/daytrader:1.0


3. Check Container by Docker Logs

$ docker logs daytrader --follow


# Verification

1. Docker Network Inspect

$ docker network inspect br0


2. Get Running Docker Container

$ docker ps


3. Get Docker Toolbox VM IP

$ docker-machine ip default


# DayTrader App Instruction

1. Open Web Browser and go to http://<ip get from step 3>:9080/daytrader 


2. Go to "Configuration" Tab


3. Click "Configure DayTrader run-time parameters"

- Run-Time Mode: Direct (JDBC)
- DayTrader Max Users: 10
- Trade Max Quotes: 10 
- Press "Update Config"


4. Click "(Re)-create  DayTrader Database Tables and Indexes"


5. Click "(Re)-populate  DayTrader Database"


6. Go to "Trading & Portfolios" and Press "Login"
