use information_schema;
show tables;
select * from table_constraints where table_name='tb1';

use test;
create table t5 (col1 int);
create table t6 (col2 int);
insert into t5 values (1),(2),(2),(3);
insert into t6 values (2),(3),(4);
select * from t5;
select * from t6;
#following two are different, try and see
#first remove all duplicate
select * from t5 union select * from t6;
select * from t5 union all select * from t6;

truncate table t1;
alter table t1 add column col5 smallint primary key;
select * from t1;
insert into t1 values (2,3),(4,5);
create table t3 as select * from t1; #copy a table from t1 to t3

desc t3; #but not constraints eg primary key
#right way
drop table t3;
create table t3 like t1; #copy exactly the same constrains but no data
insert into t3 select * from t1; #copy data
update t1 set col1=col1*10 where col5=5;

insert into t1 values (NULL,50);
insert into t1(col5) values (20);
#see the difference btw these two
select * from t1 where col1 is Null;
select * from t1 where col1=null;#null can't be compared