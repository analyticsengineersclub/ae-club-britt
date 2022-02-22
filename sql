SELECT c.id, c.name, c.email, o.created_at, o.total AS number_of_orders
FROM analytics-engineers-club.coffee_shop.customers AS c
JOIN analytics-engineers-club.coffee_shop.orders AS o
ON c.id = o.customer_id
ORDER BY created_at limit 20;