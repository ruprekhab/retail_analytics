-- Get KPIs for each category
SELECT category, SUM(sales)AS total_sales, SUM(profit) AS total_profit, ROUND(AVG(discount),4) AS avg_discount
FROM retail
GROUP BY category
ORDER BY total_sales DESC;


-- Compare sub_categories by KPIs
SELECT category, sub_category, 
SUM(sales) AS total_sales,
ROUND(SUM(profit)) AS total_profit,
ROUND(SUM(profit)/SUM(sales),4) AS profit_margin,
ROUND(AVG(discount),4) AS avg_discount
FROM retail
GROUP BY sub_category, category
ORDER BY profit_margin DESC;

-- Find the overall profit margin and avg discount
SELECT ROUND(SUM(profit)/SUM(sales),4) AS profit_margin, ROUND(AVG(discount),4) AS avg_discount
FROM retail;

-- Find products which have lower than overall profit margin, and higher than average discount
SELECT sub_category, ROUND(SUM(profit)/SUM(sales),4) AS profit_margin, ROUND(AVG(discount),4) AS avg_discount
FROM retail
GROUP BY sub_category
HAVING ROUND(SUM(profit)/SUM(sales),4) < 0.2505 and ROUND(AVG(discount),4) > 0.2268
ORDER BY profit_margin;

--Find volume of Sales for the sub categories
SELECT sub_category, COUNT(order_id) AS volume
FROM retail
GROUP BY sub_category
ORDER BY volume DESC;

--Rank Sub-Categories by Profitability Within Each Category
SELECT * FROM (SELECT category, sub_category, ROUND(SUM(profit)/SUM(sales),4) AS profit_margin,
RANK() OVER(PARTITION BY category ORDER BY SUM(profit)/SUM(sales) DESC) AS ranked_profit_margin
FROM retail
GROUP BY category, sub_category)
WHERE ranked_profit_margin <= 3
ORDER BY category, ranked_profit_margin

						  
						   

						   
