use bai_tap02_ss2;

insert into customer (customer_name, customer_age) values ('Minh Quan', 10);
insert into customer (customer_name, customer_age) values ('Ngoc Oanh', 20);
insert into customer (customer_name, customer_age) values ('Hong Ha', 50);

insert into `order` (order_date, order_total_price, customer_id) values ('2006/3/21', null, 1);
insert into `order` (order_date, order_total_price, customer_id) values ('2006/3/23', null, 2);
insert into `order` (order_date, order_total_price, customer_id) values ('2006/3/16/', null, 1);

insert into product (product_name, product_price) values ('May Giat', 3);
insert into product (product_name, product_price) values ('Tu Lanh', 5);
insert into product (product_name, product_price) values ('Dieu Hoa', 7);
insert into product (product_name, product_price) values ('Quat', 1);
insert into product (product_name, product_price) values ('Bep Dien', 2);

insert into order_detail (order_id, product_id, order_quantity) values (1, 1, 3);
insert into order_detail (order_id, product_id, order_quantity) values (1, 3, 7);
insert into order_detail (order_id, product_id, order_quantity) values (1, 4, 2);
insert into order_detail (order_id, product_id, order_quantity) values (2, 1, 1);
insert into order_detail (order_id, product_id, order_quantity) values (3, 1, 8);
insert into order_detail (order_id, product_id, order_quantity) values (2, 5, 4);
insert into order_detail (order_id, product_id, order_quantity) values (2, 3, 3);

