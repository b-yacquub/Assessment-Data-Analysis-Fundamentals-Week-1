-- A query that displays the percentage of orders that had *any* discount applied.

-- The only column should be 'percentage_discounted'

-- The percentage should be rounded to 2 d.p.

with orders_discount as (
select count(order_id) as num_orders_discounted
from orders o 
join order_details od using(order_id)
join products p using(product_id)
where discount !=0
group by order_id
)
select round((select count(*) from orders_discount)*1.0/count(*)*100,2) as percentage_discounted
from orders;