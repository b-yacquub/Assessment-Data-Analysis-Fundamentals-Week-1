-- A query that displays the full name of every employee, including their honorific, as employee_full_name.

-- Results should be ordered in descending order of employment year, with ties broken by sorting alphabetically by last name (ascending).

select (title_of_courtesy ||' '||first_name ||' '||last_name ) 
as employee_full_name 
from employees
order by hire_date desc, last_name asc;