
-- 远程无法连接问题

SELECT * FROM user u;

UPDATE user SET host = '%' WHERE User = 'root';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;

UPDATE user u
set Password=password('123456')
WHERE User = 'root'
;

flush privileges;
