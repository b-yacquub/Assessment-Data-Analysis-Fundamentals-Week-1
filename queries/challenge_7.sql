-- A query that displays the number of orders that involved 2 or more products

-- The column should be called count_of_multiple_orders

with order_more_than_1 as (
select (order_id) as num_orders
from orders o 
join order_details od using(order_id)
join products p using(product_id)
group by order_id
having count(order_id)>1
)
select count(*) as count_of_multiple_orders
from order_more_than_1;