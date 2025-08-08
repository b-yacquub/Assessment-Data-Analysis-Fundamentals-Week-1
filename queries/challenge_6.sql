-- A query that displays the average product price (average_price) for each category from each supplier when the category name contains the letter 'm' (case-insensitive).

-- The columns should be supplier, category, average_price.

-- average_price should be an integer.

-- Results should be sorted alphabetically by supplier and category.

select company_name as supplier,category_name as category, avg(p.unit_price ) over (partition by category_name) as average_price
from products p 
join categories using(category_id)
join suppliers using(supplier_id)
where category_name ilike '%m%'
order by category_name,supplier desc;