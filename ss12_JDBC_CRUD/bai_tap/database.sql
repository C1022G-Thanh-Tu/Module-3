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

select id, name, email, country from users;