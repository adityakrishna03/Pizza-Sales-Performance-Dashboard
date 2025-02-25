
select * from pizza_sales

--Daily Trend
select datename(DW, order_date) as order_day, count(distinct order_id) as Total_Orders 
from pizza_sales

group by datename(DW, order_date)

--Hourly Trend
select datepart(hour, order_time) AS Order_Hours, count(distinct order_id) as Total_Orders
from pizza_sales
group by datepart(hour, order_time)
order by datepart(hour, order_time)

--Percentage of Sales by Pizza Category
select pizza_category, cast(sum(total_price) as decimal(10, 2)) as Total_Sales, sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where month(order_date) = 1) AS PCT_Total_Sales 
from pizza_sales 
where month(order_date) = 1
group by pizza_category

--Percentage of Sales by Pizza Size
select pizza_size, cast(sum(total_price) as decimal(10, 2)) as Total_Sales, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as decimal(10,2)) AS PCT_Total_Sales 
from pizza_sales 
where datepart(quarter, order_date) = 1
group by pizza_size
order by PCT_Total_Sales desc

--Total Pizzas sold by Pizza Category
select pizza_category, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_category

--Top 5 Best Sellers by Total Pizzas Sold
select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by sum(quantity) ASC

-- bottom 5 worst sellers by total Pizzas sold
select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
WHERE month(order_date) = 8
group by pizza_name
order by sum(quantity) asc
