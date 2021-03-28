
# windows 安装

安装
```shell script
mysql_install_db.exe --service=mariadb --password=123456

mysql_install_db.exe --datadir=D:\db --service=mariadb --password=123456
```

启动
```shell script
net start mariadb
```

卸载
```shell script
mysqld -remove mariadb
```
