-- A query that displays the total integer value of all products in stock as "stock_value".

select sum(units_in_stock) as stock_value from products;