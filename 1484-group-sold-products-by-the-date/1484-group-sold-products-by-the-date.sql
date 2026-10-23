with cte as 
(
    select distinct 
    a.sell_date ,   
    a.product
    from Activities  as a
)
select
a.sell_date  ,
count(distinct a.product) as num_sold ,
STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
from  cte  as a
group by a.sell_date  
