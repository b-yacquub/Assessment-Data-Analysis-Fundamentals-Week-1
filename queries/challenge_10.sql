-- A query that displays the name of the third most expensive product(s) for each category.

-- The columns should be category_name, product_name.

-- Results should be sorted alphabetically by category.

with third_product as (
select c.category_name,p.product_name,
rank() over (partition by c.category_name order by p.unit_price desc) as price_rank
from products p
join categories c using (category_id)
)
select category_name,product_name
from third_product
where price_rank = 3
order by category_name;

