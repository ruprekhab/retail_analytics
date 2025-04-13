-- Top performing products by sales
SELECT category, sum(sales) sales FROM retail
GROUP BY category
ORDER BY sales DESC
LIMIT 10;

-- Top performing products by profit margin
SELECT category, SUM(profit)/SUM(sales) AS profit 
FROM retail
GROUP BY category
ORDER BY profit DESC
LIMIT 10;

-- Top 3 sub_category for each category by profit
SELECT * FROM (SELECT category, sub_category, SUM(profit)/SUM(sales) as profit,
RANK() OVER(PARTITION BY category ORDER BY SUM(profit)/SUM(sales)) AS profit_rank 
FROM retail
GROUP BY category, sub_category)
where profit_rank <=3
order by category, profit_rank


-- Top 3 products with maximum profit for each region
SELECT * FROM (SELECT region, category, sum(profit)/SUM(sales) as profit, 
RANK() OVER(PARTITION BY region ORDER BY sum(profit)/SUM(sales) DESC) profit_rank
FROM retail
GROUP BY region, category)
WHERE profit_rank <= 3
ORDER BY region, profit_rank;

--Find Top 3 Cities with Highest Average Discount
SELECT city, AVG(discount) AS avg_disc
FROM retail
GROUP BY city
ORDER BY avg_disc DESC
LIMIT 3;

--Rank Top 10 cities by total sales
SELECT city, SUM(sales) as total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC )
FROM retail
GROUP BY city
LIMIT 10

-- Top 10 cities by Profit 
SELECT city, SUM(profit)/SUM(sales) as profit_margin,
RANK() OVER(ORDER BY SUM(profit)/SUM(sales) DESC )
FROM retail
GROUP BY city
LIMIT 10;

-- Total sales, average discount and profit margin by region
SELECT region, COUNT(DISTINCT(category)) AS total_category, SUM(sales) AS Sales, AVG(discount) AS avg_discount, SUM(profit)/SUM(sales) AS profit_margin
FROM retail
GROUP BY region
ORDER BY profit_margin DESC;

--check total cities from each of the regions
SELECT region, COUNT(DISTINCT(city)) AS total_cities
FROM retail
GROUP BY region
ORDER BY total_cities DESC;

-- find the name of the city in north
SELECT city FROM retail
WHERE region = 'North';

-- check the sales in vellore from Northern region
SELECT EXTRACT('year' FROM order_date),order_id, category, sub_category, COUNT(DISTINCT (order_id)) AS total_orders, SUM(sales) AS total_sales
FROM retail
GROUP BY order_id
HAVING city = 'Vellore' and region = 'North'
ORDER BY total_sales DESC;


-- Total distinct subcategories orderd from each of the regions
SELECT region, COUNT(DISTINCT(sub_category)) as total_sub_category
FROM retail
GROUP BY region;

--Total distinct customers from each of the regions
SELECT region, COUNT(DISTINCT(customer_name)) as total_sub_category
FROM retail
GROUP BY region;
