create database bai_tap02_ss2;
use bai_tap02_ss2;
create table customer (
	customer_id int primary key auto_increment,
    customer_name varchar(25),
    customer_age tinyint
);
create table `order` (
	order_id int primary key auto_increment,
    order_date datetime not null,
    order_total_price int,
    customer_id int not null,
    constraint fk_order_customer_id foreign key (customer_id) references customer (customer_id)
);
create table product (
	product_id int primary key auto_increment,
    product_name varchar(25) not null,
    product_price int not null
);
create table order_detail (
	order_quantity int not null,
    order_id int not null,
    product_id int not null,
    primary key (order_id, product_id),
    constraint fk_order_detail_order_id foreign key (order_id) references `order` (order_id),
    constraint fk_order_detail_product_id foreign key (product_id) references product (product_id)
);