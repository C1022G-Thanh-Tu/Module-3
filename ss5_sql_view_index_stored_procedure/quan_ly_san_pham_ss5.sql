-- Bước 1
create database bai_tap_ss5;
use bai_tap_ss5;
-- Bước 2
create table products (
  id int primary key auto_increment, 
  product_code varchar(45), 
  product_name varchar(45), 
  product_price varchar(45), 
  product_amount varchar(45), 
  product_description varchar(45), 
  product_status varchar(45)
);
insert into products(
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  ('mt', 'máy tính', '1002039', '12', 'second hand', 'vip'), 
  ('tl', 'tủ lạnh', '234987123', '5', 'made by tung của', 'ultra vip'), 
  ('mg', 'máy giặt', '423578634', '7', 'vn high quality', 'super vip');
-- Bước 3
create index index_product_code on products (product_code);
create index index_product_name_price on products (product_name, product_price);
drop 
  index index_product_code on products;
drop 
  index index_product_name_price on products;
explain 
select 
  * 
from 
  products 
where 
  product_code = 'mt';
explain 
select 
  * 
from 
  products 
where 
  product_name = 'máy tính';
explain 
select 
  * 
from 
  products 
where 
  product_price = '1002039';
-- Bước 4
create view view_products(
  product_code_view, product_name_view, 
  product_price_view, product_status_view
) as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
select 
  * 
from 
  view_products;
set 
  sql_safe_updates = 0;
update 
  view_products 
set 
  product_status_view = 'second hand' 
where 
  product_code_view = 'mt';
set 
  sql_safe_updates = 1;
drop 
  view view_products;
-- Bước 5
delimiter // create procedure list_all_information() begin 
select 
  * 
from 
  products;
end // delimiter;
call list_all_information;
delimiter // create procedure add_new_product(
  product_code varchar(45), 
  product_name varchar(45), 
  product_price varchar(45), 
  product_amount varchar(45), 
  product_description varchar(45), 
  product_status varchar(45)
) begin insert into products(
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    product_code, product_name, product_price, 
    product_amount, product_description, 
    product_status
  );
end // delimiter;
call add_new_product (
  'đt', 'điện thoại', '23934287', 
  '22', 'samsung', 'almost vip'
);
delimiter // create procedure edit_by_id(
  id int, 
  product_code varchar(45), 
  product_name varchar(45), 
  product_price varchar(45), 
  product_amount varchar(45), 
  product_description varchar(45), 
  product_status varchar(45)
) begin 
update 
  products 
set 
  products.product_code = product_code, 
  products.product_name = product_name, 
  products.product_price = product_price, 
  products.product_amount = product_amount, 
  products.product_description = product_description, 
  products.product_status = product_status 
where 
  products.id = id;
end // delimiter;
call edit_by_id (4, '', '', '', '', '', '');
delimiter // create procedure delete_by_id (id int) begin 
delete from 
  products 
where 
  products.id = id;
end // delimiter;
call delete_by_id(4);

