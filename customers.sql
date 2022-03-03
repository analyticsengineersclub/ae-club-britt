with cust_orders as (
      select
            customer_id
            , count(*) as number_of_orders
            , min(created_at) as first_order_at
      from `analytics-engineers-club.coffee_shop.orders`
      group by 1
)
select 
      customers.id as customer_id
      , customers.name
      , customers.email
      , cust_orders.first_order_at
      , cust_orders.number_of_orders
from `analytics-engineers-club.coffee_shop.customers` as customers
left join cust_orders
      on customers.id = cust_orders.customer_id
order by 5