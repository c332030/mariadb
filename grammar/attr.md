
# 变量

## 用户变量
赋值 1
```sql
set @age=19;
set @age:=20;

```

赋值 2
```sql
select @age:=22;
```

使用
```sql
select @age;
```

## 会话变量
```sql
-- 显示所有的会话变量
show session variables;

-- 设置会话变量的值的三种方式
set session auto_increment_increment=1;
set @@session.auto_increment_increment=2;
set auto_increment_increment=3;        -- 当省略session关键字时，默认缺省为session，即设置会话变量的值

-- 查询会话变量的值的三种方式
select @@auto_increment_increment;
select @@session.auto_increment_increment;
show session variables like '%auto_increment_increment%';        -- session关键字可省略

-- 关键字session也可用关键字local替代
set @@local.auto_increment_increment=1;
select @@local.auto_increment_increment;
```

## 全局变量
```sql
-- 显示所有的全局变量
show global variables;

-- 设置全局变量的值的两种方式
set global sql_warnings=ON;        -- global不能省略
set @@global.sql_warnings=OFF;

-- 查询全局变量的值的两种方式
select @@global.sql_warnings;
show global variables like '%sql_warnings%';
```

## 局部变量
```sql
-- declare语句专门用于定义局部变量，可以使用default来说明默认值
declare age int default 0;

-- 局部变量的赋值方式一
set age=18;

-- 局部变量的赋值方式二
select StuAge 
into age
from demo.student 
where StuNo='A001';
```
