create database my_first_db;
use my_first_db;
create table Class (
	id int primary key,
    `name` varchar(45)
);
create table Teacher (
	id int primary key,
    `name` varchar(45),
    age int,
    country varchar(45)
);
select * from Class;
select * from Teacher;
drop database my_first_db;