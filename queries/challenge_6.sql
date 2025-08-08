-- A query that displays the average product price (average_price) for each category from each supplier when the category name contains the letter 'm' (case-insensitive).

-- The columns should be supplier, category, average_price.

-- average_price should be an integer.

-- Results should be sorted alphabetically by supplier and category.

SELECT 
    company_name AS supplier,
    category_name AS category,
    AVG(p.unit_price)::int AS average_price
FROM 
    products p
JOIN 
    categories USING(category_id)
JOIN 
    suppliers USING(supplier_id)
WHERE 
    category_name ILIKE '%m%'
GROUP BY 
    company_name, category_name
ORDER BY 
    company_name ASC, category_name ASC;
