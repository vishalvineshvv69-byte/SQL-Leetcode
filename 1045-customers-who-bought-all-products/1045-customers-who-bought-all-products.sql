select 
c.Customer_id
from Customer as c
group by c.Customer_id
having count(distinct c.product_key ) = (
                                            select 
                                            count(*)
                                            from Product 
                                        )