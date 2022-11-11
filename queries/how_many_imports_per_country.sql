SELECT customers.country, sum(order_details.quantity) as product_quantity 
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id 
INNER JOIN order_details 
ON orders.id = order_details.order_id 
GROUP BY(country) 
ORDER BY(product_quantity) DESC;