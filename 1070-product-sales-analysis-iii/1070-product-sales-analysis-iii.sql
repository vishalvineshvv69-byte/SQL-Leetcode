with cte as 
(
select 
s.product_id,
s.year as first_year, 
s.quantity,
s.price,
dense_rank() over(partition by s.product_id order by s.year asc) as rank
from Sales as s
)
select 
x.product_id,
x.first_year,
x.quantity,
x.price
from cte as x
where x.rank = 1
