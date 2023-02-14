use ss11_mvc_bai_tap;

create table product (
    id int primary key auto_increment,
    name varchar(45),
    price bigint,
    status varchar(45)
);

select id, name, price, status from product;

insert into product ( name, price, status) values
("television", "09045809", "vip"),
("cell phone", "09045809", "vip"),
("washing machine", "09045809", "vip"),
("laptop", "09045809", "vip"),
("drill machine", "09045809", "vip");

set sql_safe_updates = 0;
update product
set name = ?, price = ?, status = ?
where id = ?;

delete from product where id = ?;


insert into product (name, price, status) values (?, ?, ?, ?);
select id, name, price, status from product where id = ?;