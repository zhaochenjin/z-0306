show databases ;
show tables from scott;
show full columns from scott.emp;
show full columns from scott.dept;
show full columns from scott.salgrade;
select *
from scott.emp;
select *
from scott.dept;
create table scott.new_emp
select *
from scott.emp;
-- 创建一个新表new_emp，和emp里面的东西一样

select *
from scott.new_emp;
 -- 查询新表new_emp;

delete
from scott.new_emp;

drop table
scott.new_emp;

insert into scott.new_emp
(EMPNO, ENAME, DEPTNO)
select EMPNO, ENAME, DEPTNO
from scott.emp;


create or replace view scott.v_emp
as
select ename, job, DEPTNO
from scott.emp
where DEPTNO = 30;
-- 创建视图 scott.v_emp;
select * from scott.v_emp;
-- 查询视图scott.v_emp;

select ENAME, DNAME,EMPNO
from scott.emp e
            inner join scott.dept d
                       on e.DEPTNO = d.DEPTNO
where ENAME = 'allen';
 -- 查询名字是allen的....

create or replace view scott.v_name
as
select e.EMPNO, e.ENAME, d.DNAME
from scott.emp e
            inner join scott.dept d
                       on e.DEPTNO = d.DEPTNO;
 -- 创建视图scott.v_name
 select *
from scott.v_name
where ENAME = 'allen';
 -- 查询名字是allen的...

select sal
from scott.emp
where ENAME = 'sco_tt';

select *
from scott.emp
where sal > (
  select sal
  from scott.emp
  where ENAME = 'sco_tt'
); -- sub query 子查询

start transaction ; -- 开始事物
-- DMLs
delete from scott.emp
where ENAME='allen';
savepoint a;
update scott.emp
set sal=2000
where ENAME ='martin';
savepoint b;
delete from scott.emp;
select *
from scott.emp;
rollback to b; -- 去到B；
rollback to a; -- 去到A；
rollback ; -- 回滚 ,删除不了allen
commit ; -- 提交，删除了allen
create table scott.test(
id int
);

select deptno,avg(sal)
from scott.emp
group by deptno;-- 通过deptno分组
select  sum(sal)
from scott.emp;
select  min(sal),max(sal)
from scott.emp;
select count(*)
from scott.emp;
select sum(ename)
from scott.emp;
select job,max(HIREDATE)
from scott.emp
group by job -- 通过job分组
having job in('clerk','manager');-- 只要job为clerk 和 manager的

