SELECT country, products.name as product_name, sum(order_details.quantity)  as product_quantity 
FROM suppliers 
INNER JOIN products 
ON suppliers.id = products.supplier_id 
INNER JOIN order_details 
ON products.id = order_details.product_id 
GROUP BY(products.name) 
ORDER BY(country);