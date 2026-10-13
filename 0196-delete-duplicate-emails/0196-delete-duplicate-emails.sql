with cte as 
(
    select 
    p.id,
    p.email,
    row_number() over (partition by p.email order by p.id) as rank
    from Person as p
)
delete from cte 
where rank >1
