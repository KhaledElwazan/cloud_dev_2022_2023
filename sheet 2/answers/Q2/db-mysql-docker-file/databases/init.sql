create database campus;
use campus;

create table students(id int, name varchar(50) not null, age int,primary key(id));

insert into students values(1,'khaled',20);
insert into students values(2,'zeinab',21);
insert into students values(3,'fatma',22);