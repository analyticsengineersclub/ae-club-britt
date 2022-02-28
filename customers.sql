with customer_orders as (
    select
        customer_id,
        count(*) as number_of_orders,
        min(created_at) as first_order_at
    from 'analytics-engineers-club.coffee_shop_orders'
    group by 1
)

select
    customers.id as customer_id,
    customers.name,
    customers.email,
    coalesce(customer_orders.number_of_orders,  0) as number_of_orders,
    customer_orders.first_order_at
from 'analytics-engineers-club.coffee_shop_customers' as customers
left join customer_orders  
    on customers.id = customer_orders.customer_id
limit 5;