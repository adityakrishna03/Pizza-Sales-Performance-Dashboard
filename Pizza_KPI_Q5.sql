SELECT * FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(count(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order from pizza_sales

