# Daytrader Java App on Websphere Liberty and MySQL Container

Please clone this git repository to your local machine with installed docker engine / docker toolbox

- [Setup Docker Network](#setup-docker-network)
- [Create Docker Volume](#create-docker-volume)
- [Create MySQL Container](#create-mysql-container)
- [Create Daytrader with Websphere Liberty Container](#create-daytrader-with-websphere-liberty-container)
- [Verification](#verification)
- [DayTrader App Instruction](#daytrader-app-instruction)


# Setup Docker Network

Create Docker Network for Two Tier App

    docker network create --driver=bridge --subnet=192.168.0.0/24 br0

Show Docker Network

    docker network ls


# Create Docker Volume

Create Docker Volume for MySQL Container

    docker volume create daytrader-mysql-volume


Show Docker Volume

    docker volume ls


# Create MySQL Container

Pull MySQL Docker Image

    docker pull mysql:8.0.20


Run MySQL Container

    $ docker run -d --name daytrader-mysql --network br0 --publish 3306:3306 --volume daytrader-mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=daytrader_db -e MYSQL_USER=daytrader -e MYSQL_PASSWORD=daytrader mysql:8.0.20


Check Container by Docker Logs

    docker logs daytrader-mysql --follow


Enter MySQL container

    docker exec -it daytrader-mysql /bin/bash
    mysql -u root -p
    show databases;
    exit
    exit


# Create Daytrader with Websphere Liberty Container

Build Docker Image with Application and Configurations

    docker build -t l-was/daytrader:1.0 .


Run Container with Custom Image

    docker run -d --name daytrader --network br0 -p 9080:9080 -p 9443:9443 l-was/daytrader:1.0


Check Container by Docker Logs

    docker logs daytrader --follow


# Verification

Docker Network Inspect

    docker network inspect br0


Get Running Docker Container

    docker ps


Get Docker Toolbox VM IP

    docker-machine ip default


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
