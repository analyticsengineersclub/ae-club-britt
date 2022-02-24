select 
    c.id, 
    c.name, 
    c.email, 
    o.created_at, 
    o.total as number_of_orders
from analytics-engineers-club.coffee_shop.customers as c
join analytics-engineers-club.coffee_shop.orders as o
on c.id = o.customer_id
order by 
    created_at 
limit 20;