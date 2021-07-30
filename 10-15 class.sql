use test;
create table a1 (col1 smallint);
create table b1 (col1 smallint);
insert into a1 values (1),(2),(3);
insert into b1 values (3),(4),(5);
#see the difference btw (inner) join, left, right (outer) join
select * from a1 join b1 on a1.col1=b1.col1;
select * from a1 left join b1 on a1.col1=b1.col1;
select * from a1 right join b1 on a1.col1=b1.col1;

#union
select * from a1 left join b1 on a1.col1=b1.col1
UNION
select * from a1 right join b1 on a1.col1=b1.col1;

#union all
select * from a1 left join b1 on a1.col1=b1.col1
UNION ALL
select * from a1 right join b1 on a1.col1=b1.col1;


#natural join default table a and b have the same enetity name
select * from a1 natural join b1;

delete from a1;
insert into a1 values (3),(4),(5);