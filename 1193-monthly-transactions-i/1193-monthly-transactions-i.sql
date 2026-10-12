with cte as 
(
    select 
    t.id,
    t.country,
    t.state,
    t.amount,
    format(t.trans_date,'yyyy-MM') as month
    from Transactions as t
)
select 
x.month,
x.country,
count(x.id) as trans_count,
sum(case when x.state ='approved' then 1 else 0 end) as approved_count ,
sum(x.amount) as trans_total_amount,
sum(case when x.state ='approved' then x.amount else 0 end) as approved_total_amount
from cte as x
group by x.month,x.country
order by x.month asc,x.country desc