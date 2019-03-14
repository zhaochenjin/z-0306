show databases;
show tables from scott;
desc  scott.dept;
desc scott.emp;
desc scott.salgrade;
select * from emp;
select * from salgrade;
select * from dept;
# 1. 查找部门 30 中员工的详细信息
select *
from scott.emp
where DEPTNO = 30;
# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
select EMPNO, ENAME, DEPTNO
from scott.emp
where JOB = 'clerk';
# 3. 检索出奖金多于基本工资的员工信息
select *
from scott.emp
where COMM > SAL;
# 4. 检索出奖金多于基本工资 30% 员工信息
select *
from scott.emp
where COMM > SAL * 0.3;
# 5. 希望看到 10 部门的经理或者 20 部门的职员 clerk 的信息
select *
from scott.emp
where (DEPTNO = 10 and JOB = 'manager')
   or (DEPTNO = 20 and JOB = 'clerk');
# 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是 sal 高于 2000 元的员工信息
select *
from scott.emp
where (DEPTNO = 10 and JOB = 'manager')
   or (DEPTNO = 20 and JOB = 'clerk')
   or (JOB <> 'manager' and JOB <> 'clerk' and sal > 2000);

select distinct JOB
from scott.emp;
# 7. 找出获得奖金的员工的工作
select JOB, COMM
from scott.emp
where comm > 0;
# 8. 找出奖金少于 100 或者没有获得奖金的员工的信息
select *
from scott.emp
where COMM < 100 or COMM is null ;
# 9. 查找员工雇佣日期是当月的最后一天的员工信息
select *
from scott.emp
where HIREDATE=last_day(HIREDATE);
# 10. 检索出雇佣年限超过 35 年的员工信息
select *
from scott.emp
where date_add(HIREDATE, interval 35 year) < now();
# 11. 找出姓名以 A、B、S 开始的员工信息
select *
from scott.emp
where ENAME like 'A%' or ENAME like 'B%' or ENAME like 'S%';
# 12. 找到名字长度为 4 个字符的员工信息
select *
from scott.emp
where length(ename)=4;
# 13. 名字中不包含 R 字符的员工信息
select *
from scott.emp
where ename not like '%R%';
# 14. 找出员工名字的前3个字符
select substr(ename,1,3) from scott.emp;
# 15. 将名字中 A 改为 a
select replace(ename,'A','a') from scott.emp;
# 16. 将员工的雇佣日期拖后 10 年
select hiredate,add_months(hiredate,120) from scott.emp;不对
# 17. 返回员工的详细信息并按姓名排序
select *
from scott.emp
order by ename;
# 18. 返回员工的信息并按员工的工作年限降序排列
select *
from scott.emp
order by HIREDATE desc;
# 19. 返回员工的信息并按工作降序、工资升序排列
select *
from scott.emp
order by job desc,sal;
# 20. 返回员工的姓名、雇佣年份和月份，并按月份和雇佣日期排序
select ename,to_char(hiredate,'yyyy') as nian,to_char(hiredate,'mm') as yue from emp order by yue,hiredate;
# 21. 计算员工的日薪，每月按 30 天
select round((SAL + ifnull(COMM, 0)) / 30, 2)
from scott.emp;
# 22. 找出 2 月份雇佣的员工
select *
from scott.emp
where month(HIREDATE) = 9;
select * from emp where to_char(hiredate,'mm')=2;
# 23. 至今为止，员工被雇佣的天数
select trunc(sysdate-hiredate) from emp;
# 24. 找出姓名中包含 A 的员工信息
select *
from scott.emp
where ename like '%A%';
# 25. 计算出员工被雇佣了多少年、多少月、多少日
select trunc(months_between(sysdate,hiredate)/12) from emp;
