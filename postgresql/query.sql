-- Top performing products by sales
SELECT category, sub_category, sum(sales) sales FROM retail
GROUP BY category, sub_category
ORDER BY sales DESC;

-- Top performing products by profit

SELECT category, sub_category, ROUND(SUM(profit)) profit FROM retail
GROUP BY category, sub_category
ORDER BY profit DESC;

-- Top 5 products with maximum profit for each region
SELECT * FROM (SELECT region, category, ROUND(sum(profit)) as profit, 
RANK() OVER(PARTITION BY region ORDER BY SUM(profit) DESC) profit_rank
FROM retail
GROUP BY region, category)
WHERE profit_rank <= 5
ORDER BY region, profit_rank;

-- Top 3 sub_category for each category by profit
SELECT * FROM (SELECT category, sub_category, ROUND(SUM(profit)) as profit,
RANK() OVER(PARTITION BY category ORDER BY ROUND(SUM(profit))) AS profit_rank 
FROM retail
GROUP BY category, sub_category)
where profit_rank <=3
order by category, profit_rank

--Find Top 3 Cities with Highest Average Discount
SELECT city, AVG(discount) AS avg_disc
FROM retail
GROUP BY city
ORDER BY avg_disc DESC
LIMIT 3;

--Find Orders Where Profit is Below the Average
SELECT * FROM retail
WHERE profit < (
	SELECT avg(profit) from retail)
	
--Rank Top 10 cities by total sales
SELECT city, SUM(sales) as total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC )
FROM retail
GROUP BY city
LIMIT 10

-- Top 5 cities by Profit Within Each Region
SELECT * FROM (SELECT region, city, ROUND(SUM(profit)) as profit,
RANK() OVER(PARTITION BY region ORDER BY SUM(profit) DESC) AS profit_rank
FROM retail
GROUP BY city, region)
WHERE profit_rank <= 5




