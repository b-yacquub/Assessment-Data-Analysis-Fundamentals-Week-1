-- A query that displays the five most expensive products supplied by suppliers based in London or Tokyo.

-- The columns should be product_name and unit_price only.

-- Results should be sorted in descending order of price

select product_name, unit_price 
from products
join suppliers using(supplier_id)
where city = 'London' or city = 'Tokyo'
order by unit_price desc;