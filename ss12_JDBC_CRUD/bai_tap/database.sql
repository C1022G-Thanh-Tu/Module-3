use ss12_jbdc_crud;

create table users (
	id int primary key auto_increment,
    name varchar(45) not null,
    email varchar(45) not null,
    country varchar(45)
);

insert into users (name, email, country) values 
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');

select id, name, email, country from users order by name;

insert into users (name, email, country) values (?,?,?);

select id, name, email, country from users where id =? order by name;

set sql_safe_updates = 0;
update users
set name = ?, email = ?, country = ? 
where id = ?;

delete from users where id = ?;

select id, name, email, country from users where country like ? order by name;