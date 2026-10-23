select 
p.product_name,
sum(o.unit) as unit
from Products as p
join Orders as o
on p.product_id = o.product_id
where datepart(month,o.order_date) = 2
and datepart(year,o.order_date) = 2020
group by p.product_name
having sum(o.unit)>=100