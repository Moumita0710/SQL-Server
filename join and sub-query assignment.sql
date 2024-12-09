use moumita
select * from emp1
select * from dept1
----Assignment----
select deptno,(select avg(sal) from emp1 as e where e.deptno=d.deptno) as avgsal from dept1 as d group by deptno;

select d.deptno,e.job, avg(e.sal) as avs from emp1 as e join dept1 as d on e.deptno=d.deptno group by d.deptno,e.job

select deptno, min(sal),max(sal),sum(sal) from emp1 group by deptno

select ename,job,sal from emp1 where sal>3000 order by deptno,job

select min(hiredate), max(hiredate) from emp1

select deptno,job from emp1 where job='salesman' group by deptno,job having count(*)>2

 select ename,sal,deptno,job from emp1 where sal>3000

 select d.deptno,d.dname,d.loc, sum(e.sal) as ts,sum(e.comm) as com from emp1 as e join dept1 as d
 on e.deptno=d.deptno group by d.deptno,d.dname,d.loc

select e.empno,e.ename,e.hiredate,m.empno,m.ename,m.hiredate from emp1 as e
join emp1 as m on e.mgr=m.empno where e.hiredate>m.hiredate

select * from emp1 where sal>(select max(sal) from emp1 where deptno=30)

with jobavgsal as(select job, avg(sal) as avgsal from emp1 group by job), 
maxsal as(select job,max(sal) as maxsal from emp1 group by job)
select e.empno,e.ename,e.job,e.sal from emp1 e join maxsal m on e.job=m.job
where e.sal=m.maxsal

select ename,deptno,hiredate from emp1 where deptno=(select deptno from dept1 where dname='sales');
select ename,sal from emp1 where job=(select job from emp1 where empno=7369)

with minsal as(select deptno,min(sal) as ms from emp1 group by deptno)
select e.ename,e.sal,e.deptno from emp1 e join minsal m on e.deptno=m.deptno where e.sal=m.ms;

select ename,hiredate from emp1 where deptno=(select deptno from emp1 where ename='Blake') and ename!='Blake'

select ename,deptno,job from emp1 where deptno=(select deptno from dept1 where loc='Dallas') and ename!='Dallas'

