use Moumita
select * from dept1
select * from emp1
-----inner join-----
select ename,job,sal,dname,loc from emp1 join dept1 on emp1.deptno=dept1.deptno
-----inner join using alies name------
select ename,job,sal,dname,loc, E.deptno from emp1 as E join dept1 as D on E.deptno=D.deptno
-----left join-----
select dept1.deptno,job,loc from dept1 left join emp1 on dept1.deptno=emp1.deptno;
-----right join-----
select dept1.deptno,job,loc from dept1 right join emp1 on dept1.deptno=emp1.deptno;
-----self join-----
select E.ename,E.job,M.ename,M.job from emp1 E join emp1 M on E.mgr=M.empno

