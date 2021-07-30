use company;
show tables;
show databases;
select databse();
select EMPLOYEE.Fname
from EMPLOYEE 
where not exists (select *
		      from DEPENDENT
              where DEPENDENT.Essn = EMPLOYEE.Ssn);

select EMPLOYEE.Fname
from EMPLOYEE, DEPENDENT
where DEPENDENT.Essn = EMPLOYEE.Ssn;

select Fname
from EMPLOYEE, DEPARTMENT
where Dname = 'Research' and Dnumber = Dno;

select Fname, Lname
from EMPLOYEE
where not exists((select Pnumber
				  from PROJECT
                  where Dnum = 5)
                  except (select WORKS_ON.Pno
						  from WORKS_ON
                          where EMPLOYEE.Ssn = WORKS_ON.Essn));

select distinct Dname
from employee, department;
select * from PROJECT;
select * from EMPLOYEE;
select * from dependent;

create database midterm2;

select * into outfile'/Users/liuwenyi/CSE3241Repo/department.bkup' from DEPARTMENT;
create table DEPARTMENT_BK(
test int);
load data infile '/Users/liuwenyi/CSE3241Repo/EMPLOYEE.bkup' into table DEPARTMENT_BK;

