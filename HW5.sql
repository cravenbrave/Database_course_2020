show databases;
create database hw5;
use hw5;
drop table student;
create table student(
S_name char(20),
Student_number smallint,
Class smallint,
Major char(20));
show tables;
insert into student values ('Smith',17,1,'CS'), ('Brown',8,2,'CS');
update student set class = 2 where S_name = 'Smith';
delete from student where S_name = 'Smith' and Student_number = 17;
insert into student values ('Johnson',25,1,'Math');
select * from student;
create table course(
Course_name char(100),
Course_number char(20),
Credit_hours smallint,
Department char(20));
insert into course values ('Intro to CS', 'CS1310',4,'CS'), ('DS','CS3320',4,'CS'),('Dis Math','MATH2410',3,'MATH'),('DB','CS3380',3,'CS');
insert into course values ('Knowledge Engineering', 'CS4390',3,'CS');
select * from course;
 delete from section;
 drop table section;
create table section(
Section_identifier smallint,
Course_number char(20),
Semester char(20),
S_year smallint,
Instructor char(20));
insert into section values (85,'MATH2410','Fall',07,'King'),(92,'CS1310','Fall',07,'Anderson'),(102,'CS3320','Spring',08,'Knuth'),(112,'MATH2410','Fall',08,'Chang'),(119,'CS1310','Fall',08,'Anderson'),(135,'CS3380', 'Fall',08,'Stone');
select * from section;

drop table grade_report;
create table grade_report(
Student_number smallint,
Section_identifier smallint,
Grade char(20));
insert into grade_report values (17,112,'B'),(17,119,'C'),(8,85,'A'),(8,92,'A'),(8,102,'B'),(8,135,'A');
select * from grade_report;
create table prerequisite(
Course_number char(20),
Prerequisite_number char(20));
insert into prerequisite values ('CS3380','CS3320'),('CS3380','MATH2410'),('CS3320','CS1310');
select * from prerequisite;

select student.S_name from student where major='CS';
select course.Course_name from section,course where section.Instructor='King' and (section.S_year = 07 or section.S_year =08) and section.Course_number = course.Course_number;

select section.Course_number, section.Semester, section.S_year, count(*)
from section,grade_report
where section.Instructor='King' and section.Section_identifier=grade_report.Section_identifier 
group by section.Course_number, section.Semester, section.S_year;



select student.S_name, course.Course_name, course.Course_number,course.Credit_hours, section.Semester, section.S_year, grade_report.Grade
from student,course,section,grade_report
where student.Class=4 and student.Major='CS' and student.Student_number = grade_report.Student_number and course.Course_number = section.Course_number and grade_report.Section_identifier = section.Section_identifier;

use company;
select * from employee;
select Fname, Lname
from EMPLOYEE
where Dno=(select Dno
		   from EMPLOYEE
		   where Salary=(select max(Salary)
								  from employee));
                                  
select Fname, Lname
from EMPLOYEE
where Super_ssn in (select Ssn
				 from EMPLOYEE
                 where Super_ssn = '88866555');
                 
select Fname, Lname
from EMPLOYEE
where Salary >= 10000 + (select min(Salary)	
			             from EMPLOYEE);
delete from table_A;
drop table table_A;
create table table_A(
ProductType int(7) not null,
Quantity smallint not null ,
A_date varchar(20)  not null,
primary key(ProductType, Quantity, A_date),
Desription char(20));
insert into table_a values (1433671,50,'2018-10-01','OSU Mug'), (2500241,30,'2018-09-28','OSU Hand Towel'),(3587001,20,'2018-10-08','OSU Pen'),(1433671,15,'2018-08-31','OSU Mug');
select * from table_a;

create table table_B(
ProductType int(7) not null,
InStock smallint,
Desription char(20),
primary key (ProductType),
constraint table_b_ibfk_1 foreign key (ProductType) references table_A (ProductType)); 
desc table_b;
insert into table_b values (1433671,100,'OSU Mug'), (2500241,12,'OSU Hand Towel'),(3587001,67,'OSU Pen');
select * from table_b;

drop procedure UpdateCatrogory;
drop trigger updateInventory;
create trigger updateInventory 
after insert 
on table_a 
for each row 
call UpdateCatrogory (new.ProductType, new.Quantity, new.A_date, new.Desription); 

DELIMITER $$
create procedure UpdateCatrogory(in proType int(7), qty smallint, A_dt char(20), desp char(20))
SQL security invoker
BEGIN
	declare ordercnt smallint;
    select count(*) from table_b where ProductType = proType into @ordercnt;
    if ordercnt=0 then
    insert into table_b(ProductType, InStock, Desription) values (proType, qty, desp);
    end if;
    if ordercnt !=0 then
    update table_b set
    InStock = InStock+qty
    where ProductType = proType;
    end if;
END $$
DELIMITER ;
insert into table_a(ProductType,Quantity,A_date) values (2500246,42,'2020-10-19');
insert into table_a values (2500243,10,'2020-10-19','Test2');
desc table_b;

delete from table_b where ProductType=2500246;
delete from table_a;
select * from table_a;
select * from table_b;
