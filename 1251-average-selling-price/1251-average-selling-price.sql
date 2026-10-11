select 
p.product_id ,
isnull(round(cast (sum(p.price  * u.units)as float )/ nullif(sum(u.units),0),2) ,0)as average_price 
from Prices as p
 left join UnitsSold  as u
on p.product_id = u.product_id 
and u.purchase_date  between p.start_date and p.end_date   
group by p.product_id 