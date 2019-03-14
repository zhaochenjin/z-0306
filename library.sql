show databases ;
drop database if exists db_library;
create database db_library;

drop table if exists db_library.user;
create table db_library.user(
                             id int auto_increment primary key comment 'pk id',
                             user varchar(255) not null comment 'user',
                             password varchar(255) not null comment'password',
                             role int (1) not null default 0 comment 'role 0-student 1-admin'
)comment 'user table';

drop table if exists db_library.books;
create table db_library.books(
                                 id int auto_increment primary key comment 'id PK',
                                 title varchar(255) not null comment 'books title',
                                 number int not null comment 'books number'
)comment 'books table ';

drop table if exists db_library.borrow;
create table db_library.borrow(
                               id int auto_increment primary key comment 'id PK',
                               time datetime not null default now() comment 'borrow time',
                               userId int not null comment 'user id',
                               booksId int not null comment 'books id'
)comment 'borrow table';

alter table db_library.borrow
  add constraint
    borrow_fk_userId
    foreign key (userId)
      references db_library.user (id);

alter table db_library.borrow
  add constraint
    borrow_fk_booksId
    foreign key (booksId)
      references db_library.books (id);

-- add admin  创建管理员信息
insert into db_library.user value (null, 'admin', md5('123'), 1);

-- admin sign in 'xxx', 'yyy'   管理员登陆
select *
from db_library.user
where user = 'admin'
and password = md5('123');

-- 对图书进行增删改查
-- create
insert into db_library.books value (null, '鲁滨逊漂流记',097);
insert into db_library.books value (null, '骆驼祥子',098);

-- delete
delete
from db_library.books
where id = 1;

-- update
update db_library.books
set title = ''
where id = 1;

-- retrieve
select *
from db_library.books;


-- student sign up  学生注册
insert into db_library.user(user, password) value ('Tom', md5('abc'));
insert into db_library.user(user, password) value ('Jerry', md5('def'));
insert into db_library.user(user, password) value ('Tester', md5('ghi'));

-- student sign in 'xxx', 'yyy' 学生登陆
select *
from db_library.user
where user = 'jerry'
and password = md5('def');

-- student enroll 学生借书
insert into db_library.borrow(id, userId, booksId) value (null, 2, 1);
insert into db_library.borrow(id, userId, booksId) value (null, 3, 2);

-- admin sign in retrieve 查询已借的书
select u.user, a.number
from db_library.user u
       inner join db_library.borrow e
                  on u.id = e.userId
       inner join db_library.books a
                  on e.booksId = a.id;

select *
from db_library.user;
select *
from db_library.books;
select *
from db_library.borrow;


drop database db_library;