with cte as
(
    select 
    p.*,
    row_number() over (partition by p.product_id order by p.change_date desc  ) rank
    from Products  as p
    where change_date <= '2019-08-16'
)
select 
x.product_id ,
x.new_price as price 
from cte as x
where x.rank = 1
union all
select distinct 
p.product_id,
10
from Products as p
where p.product_id not in (select x.product_id from cte as x)