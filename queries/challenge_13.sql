-- A query that returns full employee names and a list of their assigned territories

-- Columns should be employee and assigned_territories only

-- Only territories with single-word descriptions should be included

-- Rows should be ordered by number of territories in descending order

-- Territory lists should be in alphabetical order

-- Territory lists should be lists, not concatenated strings

select (e.first_name|| ' '|| e.last_name) AS employee,
ARRAY_AGG(t.territory_description order by t.territory_description) as assigned_territories
from employees e
join employee_territories et using(employee_id)
join territories t using(territory_id)
where position(' ' IN t.territory_description) = 0
group by e.employee_id, e.first_name, e.last_name
order by count(t.territory_id) desc;