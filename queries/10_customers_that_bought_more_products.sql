SELECT customers.name, sum(order_details.quantity) as product_quantity, sum(products.price * order_details.quantity) as total
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id 
INNER JOIN order_details 
ON orders.id = order_details.order_id 
INNER JOIN products
ON products.id = order_details.product_id
GROUP BY(customers.name) 
ORDER BY product_quantity DESC, total DESC
LIMIT 10;