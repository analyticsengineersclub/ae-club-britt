select 
      orders.customer_id
      , customers.name
      , customers.email
      , min(orders.created_at) first_order_at
      , count(orders.id) number_of_orders
from analytics-engineers-club.coffee_shop.customers
join analytics-engineers-club.coffee_shop.orders
on orders.customer_id = customers.id
group by 1, 2, 3
order by first_order_at
limit 5