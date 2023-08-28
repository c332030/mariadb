@echo off

sc delete mariadb

set app_path=%~dp0
if exist "%app_path%\data\mysql" (
    sc create mariadb
       binpath= "\"%app_path%\app\bin\mysqld.exe\" \"--defaults-file=%app_path%\data\my.ini\" \"mariadb\""
       start= auto
) else (
    cd %app_path%\app\bin
    mysql_install_db.exe --service=mariadb --password=123456 --datadir=%app_path%\data
)
net start mariadb

pause >nul
