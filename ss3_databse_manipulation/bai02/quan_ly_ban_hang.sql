use bai_tap02_ss2;

select order_id, order_date, order_total_price from `order`;

select customer_name as 'khách hàng', product_name as 'sản phẩm'
from order_detail
inner join `order` on order_detail.order_id = `order`.order_id
inner join product on order_detail.product_id = product.product_id
inner join customer on customer.customer_id = `order`.customer_id;

select customer.customer_name from customer
left join `order` on customer.customer_id = `order`.customer_id
where `order`.customer_id is null;

select `order`.order_id, `order`.order_date, order_detail.order_quantity*product.product_price as order_total_price 
from order_detail
inner join `order` on order_detail.order_id = `order`.order_id
inner join product on order_detail.product_id = product.product_id;