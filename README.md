# daytrader-lwas

# Mysql

1. Docker Network
$ docker network create --driver=bridge --subnet=192.168.0.0/24 br0
$ docker network ls

2. Docker Volume
$ docker volume create daytrader-mysql-volume
$ docker volume ls

3. Pull Image
$ docker pull mysql:8.0.20

4. Run Container
$ docker run -d --name daytrader-mysql \\
--network br0 \\
--publish 3306:3306 \\
--volume daytrader-mysql-volume:/var/lib/mysql \\
-e MYSQL_ROOT_PASSWORD=admin \\
-e MYSQL_DATABASE=daytrader_db \\
-e MYSQL_USER=daytrader \\
-e MYSQL_PASSWORD=daytrader \\
mysql:8.0.20

5. Docker Network Inspect
$ docker network inspect br0

6. Get Docker Toolbox VM IP
$ docker-machine ip default

7. Enter mysql container
$ docker exec -it mysql /bin/bash
$ mysql -u root -p
$ show databases;


# Websphere Liberty

docker build -t t-was/demo:1.0 .

docker run -d --name t-was -p 9060:9060 -p 9043:9043 -p 9080:9080 -p 9443:9443 t-was/sample-app:1.0

L-was
user: 1001
group: 0

Port 9080, 9443


docker build -t l-was/daytrader:1.0 .

docker run -d --name daytrader --network br0 -p 9080:9080 -p 9443:9443 l-was/daytrader:1.0
