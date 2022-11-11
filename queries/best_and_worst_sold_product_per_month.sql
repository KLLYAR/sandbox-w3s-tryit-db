CREATE VIEW [products_orders_with_details] 
AS 
SELECT products.name as product_name, order_details.quantity as quantity, orders.order_date as date
FROM orders
INNER JOIN order_details
ON orders.id = order_details.order_id
INNER JOIN products
ON products.id = order_details.product_id;

SELECT max_product.product_name, max_product.quantity, min_product.product_name, min_product.quantity, strftime('%Y-%m', max_product.date) as date 
FROM 
(
SELECT product_name, max(quantity) as quantity, date
FROM [products_orders_with_details]
WHERE date LIKE "1996-10-%"
) as max_product
INNER JOIN 
(
SELECT product_name, min(quantity) as quantity, date
FROM [products_orders_with_details]
WHERE date LIKE "1996-10-%"
) as min_product;