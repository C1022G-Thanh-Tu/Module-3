create database bai_tap02_ss2;
use bai_tap02_ss2;
create table customer (
	customer_id int primary key,
    customer_name varchar(45) not null,
    customer_age varchar(10) not null
);
create table `order` (
	order_id int primary key,
    order_date date not null,
    order_total_price varchar(45) not null,
    customer_id int not null,
    constraint fk_order_customer_id foreign key (customer_id) references customer (customer_id)
);
create table product (
	product_id int primary key,
    product_name varchar(45) not null,
    product_price varchar(45) not null
);
create table order_detail (
	order_quantity varchar(45) not null,
    order_id int not null,
    product_id int not null,
    primary key (order_id, product_id),
    constraint fk_order_detail_order_id foreign key (order_id) references `order` (order_id),
    constraint fk_order_detail_product_id foreign key (product_id) references product (product_id)
);