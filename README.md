# Daytrader Java App on Websphere Liberty and MySQL Container

Please clone this git repository to your local machine with installed docker engine / docker toolbox

- [Setup Docker Network](#setup-docker-network)
- [Create Docker Volume](#create-docker-volume)
- [Deploy MySQL Container](#deploy-mysql-container)
- [Deploy Daytrader Container](#deploy-daytrader-container)
- [Monitoring](#monitoring)
- [DayTrader App Instruction](#daytrader-app-instruction)
- [Operational Process](#operational-process)
- [Test Docker Volume](#test-docker-volume)


# Setup Docker Network

Create Docker Network for Two Tier App

    docker network create --driver=bridge --subnet=192.168.0.0/24 br0


Show Docker Network

    docker network ls
    
    
Show Docker Network Details

    docker network inspect br0


# Create Docker Volume

Create Docker Volume for MySQL Container

    docker volume create daytrader-mysql-volume


Show Docker Volume

    docker volume ls
    

Show Docker Volume Details

    docker volume inspect daytrader-mysql-volume


# Deploy MySQL Container

Pull MySQL Docker Image

    docker pull mysql:8.0.20


Deploy MySQL Container

    docker run -d --name daytrader-mysql --network br0 --publish 3306:3306 --volume daytrader-mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=daytrader_db -e MYSQL_USER=daytrader -e MYSQL_PASSWORD=daytrader mysql:8.0.20


Check Container by Docker Logs

    docker logs daytrader-mysql --follow
    
    
Display Running Processes of Container

    docker top daytrader-mysql


Enter MySQL container

    docker exec -it daytrader-mysql /bin/bash
    mysql -u root -p
    show databases;
    exit
    exit


# Deploy Daytrader Container

Build Docker Image with Application and Configurations

    docker build -t l-was/daytrader:1.0 .


Run Container with Custom Image

    docker run -d --name daytrader --network br0 -p 9080:9080 -p 9443:9443 l-was/daytrader:1.0


Check Container by Docker Logs

    docker logs daytrader --follow
    
Display Running Processes of Container

    docker top daytrader


# Monitoring

Docker Network Inspect

    docker network inspect br0


Get Running Docker Container

    docker ps
    
Display Docker Container(s) Resource Usage Statistics

    docker stats --no-stream


Get Docker Toolbox VM IP

    docker-machine ip default


# DayTrader App Instruction

1. Open Web Browser and go to http://<Host IP / Docker Toolbox VM IP>:9080/daytrader 


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


# Operational Process

Stop Daytrader Container

    docker stop daytrader
    docker ps
    
Start Daytrader Container

    docker start daytrader
    docker ps
    
# Test Docker Volume

Stop MySQL Container

    docker stop daytrader-mysql
  
Remove MySQL Container

    docker rm daytrader-mysql
    
    
When you try to login daytrader, error occurs.

  
Deploy MySQL Container 

    docker run -d --name daytrader-mysql --network br0 --publish 3306:3306 --volume daytrader-mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=daytrader_db -e MYSQL_USER=daytrader -e MYSQL_PASSWORD=daytrader mysql:8.0.20
    

When MySQL is up and running, you can try to login daytrader again. 

