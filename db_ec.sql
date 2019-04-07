show databases ;
drop database if exists db_ec;
create database db_ec;

drop table if exists db_ec.user;
create table db_ec.user(
  id int auto_increment primary key comment 'id PK',
  email varchar(255) not null unique comment 'email',
  password varchar(255) not null comment 'password',
  mobile varchar(255) not null unique comment 'mobile'
)comment 'user table';
drop table if exists db_ec.user_info;
create table db_ec.user_info
(
  id     int auto_increment primary key comment 'id PK',
  avatar varchar(255) comment 'avatar',
  gender char(2) comment 'gender',
  city   varchar(255) comment 'city',
  userId int comment 'user id FK'
) comment 'user info table';
drop table if exists db_ec.category;
create table db_ec.category(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment 'title',
  picture varchar(255) comment 'category picture',
  categoryId int comment 'parent category id '
)comment 'category table';

drop table if exists db_ec.product;
create table db_ec.product(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) not null comment '产品名称',
  price decimal(8,2) not null comment '产品价格',
  originalPrice decimal(8,2) comment 'original price',
  -- ...
  -- slidePictures text not null comment 'slide pictures', -- '1.jpg 2.jpg 3.jpg 4.jpg 5.jpg'
  -- detail pictures ?
  categoryId int comment 'category id FK'
 )comment 'product table';

-- pictures table
drop table if exists db_ec.pictures;
create table db_ec.pictures
(
  id        int auto_increment primary key comment 'id PK',
  title     varchar(255) not null unique comment 'title NN UN',
  type      int(1)       not null comment 'type: 1-slide picture 2-detail picture',
  productId int comment 'product id FK'
) comment 'pictures table';

alter table db_ec.user_info
  add constraint
    user_info_fk_userId
    foreign key (userId)
      references db_ec.user(id);
alter table db_ec.category
  add constraint
    category_fk_categoryId
    foreign key (categoryId)
      references db_ec.category (id);

alter table db_ec.product
  add constraint
    product_fk_categoryId
    foreign key (categoryId)
      references db_ec.category (id);

alter table db_ec.pictures
  add constraint
    pictures_fk_productId
    foreign key (productId)
      references db_ec.product (id);


select *
from db_ec.user;

select *
from db_ec.user_info;

select *
from db_ec.category;

select *
from db_ec.product;

select *
from db_ec.pictures;


drop table if exists db_ec.order;
create table db_ec.user(

)comment '';
-- 增加用户名
insert into db_ec.user value (null,'zhao',md5(zhao));
-- 用户名登陆
select * from db_ec.user where user='zhao'and password =md5('zhao');

drop database db_ec;

drop table if exists db_ec.order;
create table db_ec.order
(
  id     int auto_increment primary key comment 'id PK',
  store varchar(255) comment '店铺',
  property varchar(255) comment '属性',
  price  double(6,2) comment '单价',
  quantity int comment '数量',
  TotalPrice int comment '总价',
  site varchar(255) comment '地址',
  recipients varchar(255) comment '收件人',
  tel varchar(255) comment '电话号码'
) comment 'db_ec.order table';

