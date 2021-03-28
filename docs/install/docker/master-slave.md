
# 主从

docker-compose

```shell script
docker run -d \
  --privileged=true \
  --restart unless-stopped \
  \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  \
  -v /etc/localtime:/etc/localtime \
  \
  -v $APP_HOME/$NAME:/usr/local/mysql \
  -v $APP_HOME/$NAME/my.conf:/etc/mysql/my.conf \
  -v $APP_HOME/$NAME/log:/var/log/mysql \
  -v $APP_HOME/$NAME/data:/var/lib/mysql \
  \
  -p $PORT:3306 \
  -e MYSQL_ROOT_PASSWORD=123456 \
  \
  --name $NAME \
  \
  $IMAGE:$TAG

```


```yaml
# docker-compose.yml

&mariadb-master:mariadb-master
&mariadb-slave:mariadb-slave

&port:3306

common: &common
  image: "mariadb:10.4"
  restart: unless-stopped
  environment:
    MYSQL_ROOT_PASSWORD: 123456

common-volumes: &common-volumes
  - /etc/localtime:/etc/localtime

build:
  context: /home/program

version: "3"
services:
  *mariadb-master:
    <<: *common
    ports:
      - 3307: *port
    volumes:
      <<: *common-volumes
      - *mariadb-master :/usr/local/mysql
      - *mariadb-master /my.conf:/etc/mysql/my.conf
      - *mariadb-master /log:/var/log/mysql
      - *mariadb-master /data:/var/lib/mysql

  *mariadb-slave:
    <<: *common
    ports:
      - 3308: *port
    volumes:
      <<: *common-volumes
      - *mariadb-slave :/usr/local/mysql
      - *mariadb-slave /my.conf:/etc/mysql/my.conf
      - *mariadb-slave /log:/var/log/mysql
      - *mariadb-slave /data:/var/lib/mysql

```
