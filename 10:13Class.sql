use test;
create table TB1(
col1 smallint,
col2 smallint not null,
col3 smallint not null default 10,
col4 smallint null,
col5 smallint null default 20,
primary key (col1));
create table t1(
col1 smallint,
col5 smallint not null,
primary key (col5));
drop table t1;
describe tb1;
select database();
drop table tb1;
select * from tb1;
insert into tb1 (col2) values (33); #return error, bc col1 is pk, but no value inserted
select database();
insert into tb1 (col1,col2,col3) values (9,10,11);
insert into tb1 (col1,col2) values (21,13);
select count(*) from tb1;
alter table tb1 drop primary key; #drop pk in tb1
use test;
alter table tb1 modify col1 smallint null;#allow col1 be null
describe t1;
alter table tb1 add foreign key (col3) references t1(col5);
truncate table tb1;
alter table tb1 add constraint tb1_fk2 foreign key (col4) references t1(col5);
alter table tb1 drop foreign key tb1_ibfk_1;
alter table tb1 rename column col5 to col15; #rename entity name
truncate table tb1;
create table t3 like t1;