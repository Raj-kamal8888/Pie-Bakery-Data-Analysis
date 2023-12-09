use bakery;
show tables;
--1. Retrieve all pie sales records:
SELECT * FROM pie_sales;

--2. Calculate total sales for each pie type:
SELECT pie_type, SUM(quantity_sold) AS total_sold, SUM(total_sales) AS total_revenue
FROM pie_sales
GROUP BY pie_type;

-- 3.Identify the top-selling pie types:
SELECT pie_type, SUM(quantity_sold) AS total_sold
FROM pie_sales
GROUP BY pie_type
ORDER BY total_sold DESC
LIMIT 10;

--4. Analyze sales trends by day of the week:
SELECT DAYOFWEEK(date) AS day, SUM(quantity_sold) AS total_sold
FROM pie_sales
GROUP BY DAYOFWEEK(date)
ORDER BY day;

--5.Investigate seasonal variations in sales:
SELECT MONTH(date) AS month, SUM(quantity_sold) AS total_sold
FROM pie_sales
GROUP BY MONTH(date)
ORDER BY month;

--6. Analyze the relationship between pie price and sales quantity:
SELECT pie_type, price, SUM(quantity_sold) AS total_sold
FROM pie_sales
GROUP BY pie_type, price
ORDER BY price;

--7.Calculate average sales per customer:
SELECT AVG(SUM(total_sales)) AS avg_sales_per_customer
FROM pie_sales
GROUP BY customer_id;

--8.Identify customers with the highest purchase frequency:
SELECT customer_id, COUNT(*) AS total_purchases
FROM pie_sales
GROUP BY customer_id
ORDER BY total_purchases DESC
LIMIT 10;

--9.Analyze the effectiveness of marketing campaigns:
SELECT marketing_campaign, SUM(quantity_sold) AS total_sales
FROM pie_sales
WHERE marketing_campaign IS NOT NULL
GROUP BY marketing_campaign;

--10.Identify pie types with the highest profit margin:
SELECT pie_type, SUM(total_sales) - SUM(cost_of_goods_sold) AS profit
FROM pie_sales
GROUP BY pie_type
ORDER BY profit DESC;

--11.Identify pie types with the highest profit margin:
SELECT pie_type, SUM(total_sales) - SUM(cost_of_goods_sold) AS profit
FROM pie_sales
GROUP BY pie_type
ORDER BY profit DESC;

--12 Analyze customer preferences and identify potential new pie flavors:
SELECT customer_id, GROUP_CONCAT(pie_type) AS favorite_pies
FROM pie_sales
GROUP BY customer_id;

--13.Identify peak order times and optimize staffing schedules:
SELECT HOUR(order_time) AS hour, SUM(quantity_sold) AS total_orders
FROM pie_sales
GROUP BY HOUR(order_time)
ORDER BY total_orders DESC;

--14.Track delivery costs and optimize delivery routes:
SELECT delivery_zone, SUM(delivery_cost) AS total_cost
FROM pie_sales
GROUP BY delivery_zone;

--15.Analyze customer feedback and identify areas for improvement:
SELECT sentiment, COUNT(*) AS total_feedback
FROM customer_feedback
GROUP BY sentiment;

--16.Compare the performance of different bakery locations:
SELECT location, SUM(quantity_sold) AS total_sales, SUM(total_revenue) AS total_revenue
FROM pie_sales
GROUP BY location;

