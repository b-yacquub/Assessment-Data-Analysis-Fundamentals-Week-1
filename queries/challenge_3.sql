-- A query that displays category_name and product_name only for each product where the product name begins with "S".

-- Results should be ordered alphabetically by category_name and product_name

select category_name, product_name
from products
join categories using(category_id)
where product_name ilike 's%'
order by product_name desc;