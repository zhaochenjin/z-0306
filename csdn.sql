show databases ;
drop database if exists db_csdn;
create database db_csdn;

drop table if exists db_csdn.user;
create table db_csdn.user(
                           id int auto_increment primary key comment 'id PK',
                           username varchar(255) not null comment 'username',
                           password varchar(255) not null comment 'password',
                           email varchar(255) not null comment 'email'
)comment 'csdn table';

select *
from db_csdn.user;

load data local infile 'd:/www.csdn1.net.sql'
  into table db_csdn.user
  fields terminated by '♥'
  (username, password, email)
  set id = null;

-- 查询排名前十的密码？
select password, count(password)
from db_csdn.user
group by password
order by 2 desc
limit 10 offset 0;

-- 如果 index 只有好处，没有必要存在这个概念
create index ind_password on db_csdn.user(password); -- 434176 KB
create index ind_username on db_csdn.user(username); -- 434176 KB
create index ind_email on db_csdn.user(email); -- 434176 KB
drop index ind_password on db_csdn.user;
drop index ind_username on db_csdn.user;
drop index ind_email on db_csdn.user;
show index from db_csdn.user;


select password, count(password)
from db_csdn.user
group by password
order by 2 desc
limit 10 offset 0;

select *
from db_csdn.user
limit 100 offset 0;


select password
from db_csdn.user
where password regexp '^\198[0-9]{1}[0-9]{1,2}[0-9]{1,2}$';

select md5('123');
select md5('521');

drop database db_csdn;