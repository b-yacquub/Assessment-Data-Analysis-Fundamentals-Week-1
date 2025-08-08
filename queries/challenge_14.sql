-- A query that creates or replaces a VIEW, customer_summary, containing an overview of all customers with more than 15 orders

-- The view should have columns company, city, and total_orders only

-- Rows should be sorted in ascending order by the date of the customer's earliest order

create or replace view customer_summary as 
select sh.company_name as company,city, count(order_id) as total_orders
  FROM orders o 
  JOIN order_details od USING(order_id)
  JOIN products p USING(product_id)
  join customers using(customer_id)
  join shippers sh on o.ship_via = sh.shipper_id
  group by sh.company_name,city
  having count(order_id)>15