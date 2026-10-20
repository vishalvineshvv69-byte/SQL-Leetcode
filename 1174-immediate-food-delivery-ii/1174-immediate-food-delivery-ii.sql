with cte as
(
    select
    d.delivery_id,
    d.customer_id,
    d.customer_pref_delivery_date,
    d.order_date,
    case
    when order_date = customer_pref_delivery_date then 'immediate'
    else 'scheduled'
    end  immediate
    from Delivery as d 
),
cte2 as 
(
    select
    x.customer_id,
    min(x.order_date) as st
    from cte as x
    group by x.customer_id
),
final as
(
    select
    x.customer_id,
    x.st,
    v.immediate
    from cte2 as x
    left join cte as v
    on x.st = v.order_date
    and x.customer_id =v.customer_id
)
select 
round(cast(count(case when f.immediate = 'immediate' then 1 end ) as float) /cast(count(*) as float)* 100,2) as immediate_percentage 
from final as f