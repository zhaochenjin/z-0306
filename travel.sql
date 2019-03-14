show databases ;
drop database if exists db_travel;
create database db_travel;

drop table if exists db_travel.user;
create table db_travel.user(
  id int auto_increment primary key comment 'pk id',
  user varchar(255) not null comment 'user',
  password varchar(255) not null comment'password',
  role int (1) not null default 0 comment 'role 0-student 1-admin'
  )comment 'user table';

drop table if exists db_travel.activity;
create table db_travel.activity(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'activity title'
)comment 'activity table ';

drop table if exists db_travel.enroll;
create table db_travel.enroll(
  id int auto_increment primary key comment 'id PK',
  time datetime not null default now() comment 'enroll time',
userId int not null comment 'user id',
activityId int not null comment 'activity id'
)comment 'enroll table';

alter table db_travel.enroll
  add constraint
    enroll_fk_userId
    foreign key (userId)
      references db_travel.user (id);

alter table db_travel.enroll
  add constraint
    enroll_fk_activityId
    foreign key (activityId)
      references db_travel.activity (id);

-- add admin
insert into db_travel.user value (null, 'admin', md5('123'), 1);

-- admin sign in 'xxx', 'yyy'
select *
from db_travel.user
where user = 'admin'
and password = md5('123');

-- create
insert into db_travel.activity value (null, '植物园一日游');
insert into db_travel.activity value (null, '动物园一日游');

-- delete
delete
from db_travel.activity
where id = 1;

-- update
update db_travel.activity
set title = ''
where id = 1;

-- retrieve
select *
from db_travel.activity;


-- student sign up
insert into db_travel.user(user, password) value ('Tom', md5('abc'));
insert into db_travel.user(user, password) value ('Jerry', md5('def'));
insert into db_travel.user(user, password) value ('Tester', md5('ghi'));


-- student sign in 'xxx', 'yyy'
select *
from db_travel.user
where user = 'jerry'
  and password = md5('def');

# delete from db_a.user;
# set foreign_key_checks = 0;
# set foreign_key_checks = 1;
# truncate db_a.user;

-- student enroll
insert into db_travel.enroll(id, userId, activityId) value (null, 2, 1);
insert into db_travel.enroll(id, userId, activityId) value (null, 3, 2);

-- admin sign in retrieve
select u.user, a.title
from db_travel.user u
       inner join db_travel.enroll e
                  on u.id = e.userId
       inner join db_travel.activity a
                  on e.activityId = a.id;

select u.user, a.title
from db_travel.user u
       inner join db_travel.enroll e
                  on u.id = e.userId
       inner join db_travel.activity a
                  on e.activityId = a.id
where a.id = 1;

select *
from db_travel.user;
select *
from db_travel.activity;
select *
from db_travel.enroll;

drop database db_travel;

