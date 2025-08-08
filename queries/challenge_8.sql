-- A query that displays the first ten orders where the total price is more than the price of the most expensive product in the database.

-- The columns should be order_id and total_price only.

-- total_price should be displayed as an integer.

-- Results should be ordered by descending order_id

-- When calculating the order price, ignore any discounts and use the warehouse-standard price for the products only

select order_id, sum(p.unit_price )::int as total_price
from orders o 
join order_details od using(order_id)
join products p using(product_id)
group by o.order_id 
having sum(p.unit_price )>max(p.unit_price )
order by o.order_id desc
limit 10;