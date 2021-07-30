use test;
create table 4TBa(
ID smallint,
Age smallint not null,
Class char(20) not null,
primary key (AGE, Class));

create table 4TBb(
AGE smallint not null,
Class char(20) not null,
Rate smallint,
primary key (AGE, Class));
truncate 4TBb;
desc 4TBb;
insert into 4TBa values (1,1,'A'),(2,2,'B'),(3,2,'C');
insert into 4TBb values (1,'A',100),(4,'A',85),(5,'B',95);

select * from 4TBa;
select * from 4TBb;

select * from 4TBa join 4TBb on 4TBa.Age=4TBb.Age;
select * from 4TBa left join 4TBb on 4TBa.Age=4TBb.Age;
select * from 4TBa right join 4TBb on 4TBa.Age=4TBb.Age;

select * from 4TBa left join 4TBb on 4TBa.Age=4TBb.Age
UNION
select * from 4TBa right join 4TBb on 4TBa.Age=4TBb.Age;

select * from 4TBa left join 4TBb on 4TBa.Age=4TBb.Age
UNION ALL
select * from 4TBa right join 4TBb on 4TBa.Age=4TBb.Age;