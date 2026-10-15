with cte as 
(
    select 
    o.customer_number ,
    count(order_number) as TotalOrders
    from Orders as o
    group by o.customer_number 
)
select 
x.customer_number
from cte as x
where x.TotalOrders >= all (
    select 
    x.TotalOrders
    from cte as x
)
