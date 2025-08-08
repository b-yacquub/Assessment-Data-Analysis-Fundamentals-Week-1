-- A query that returns details on the difference in price between individual orders (including discount) and the standard warehouse price

-- Products have a standard price, but an additional percentage discount may be applied to the product total

-- The columns should be order_id, expected_price, actual_price, and price_difference

-- Only the top five rows (in descending order of price_difference) should be displayed

-- All values should be rounded to 2 d.p. for display (but otherwise kept at full precision)

with prices as (
select order_id, sum(p.unit_price*od.quantity ) as expected_price, sum(p.unit_price *od.quantity * (1 - discount)) as actual_price
from orders o join order_details od using(order_id)
join products p using(product_id)
group by order_id
)
select 
order_id, round(expected_price::numeric, 2) as expected_price, round(actual_price::numeric, 2) as actual_price, round((expected_price - actual_price)::numeric, 2) as price_difference
from prices
order by price_difference desc
limit 5;