-- A query that creates or replaces a VIEW, customer_summary, containing an overview of all customers with more than 15 orders

-- The view should have columns company, city, and total_orders only

-- Rows should be sorted in ascending order by the date of the customer's earliest order


create or replace view customer_summary as
WITH order_15 AS (
    SELECT 
        c.customer_id, 
        COUNT(o.order_id) AS total_orders,
        Min(o.order_date ) as o_date
    FROM customers c
    JOIN orders o USING (customer_id)
    JOIN shippers sh ON o.ship_via = sh.shipper_id
    GROUP BY c.customer_id 
    HAVING COUNT(o.order_id) > 15
)
SELECT 
    c.company_name as company, 
    c.city as city,
    o15.total_orders as total_orders
FROM order_15 o15
JOIN customers c ON o15.customer_id = c.customer_id
order by o15.o_date asc;