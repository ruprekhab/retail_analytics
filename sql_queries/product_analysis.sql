-- Get KPIs for each category
SELECT category, 
SUM(sales)AS total_sales, 
SUM(profit) AS total_profit, 
ROUND(AVG(discount),4) AS avg_discount
FROM retail
GROUP BY category
ORDER BY total_sales DESC;


-- Compare sub_categories by KPIs
SELECT 
	category, 
	sub_category, 
	SUM(sales) AS total_sales,
	ROUND(SUM(profit)) AS total_profit,
	ROUND(SUM(profit)/SUM(sales),4) AS profit_margin,
	ROUND(AVG(discount),4) AS avg_discount
FROM retail
GROUP BY sub_category, category
ORDER BY profit_margin DESC;

-- Create CTE to calculate overall benchmark
WITH benchmark AS (SELECT 
ROUND(SUM(profit)/SUM(sales),4) AS overall_margin,
ROUND(AVG(discount),4) AS avg_discount
FROM retail),

-- Create CTE to calculate sub_category KPIs
sub_category AS (SELECT 
				 sub_category, ROUND(SUM(profit)/SUM(sales),4) AS profit_margin,
				 ROUND(AVG(discount),4) AS avg_disc
				 FROM retail
				 GROUP BY sub_category);

-- Find sub categories with profit margin below overall benchmark and avg discount above overall benchmark
SELECT sc.sub_category, sc.profit_margin, sc.avg_disc
FROM sub_category sc, benchmark b
where sc.profit_margin < b.overall_margin
AND sc.avg_disc > b.avg_discount
ORDER BY sc.profit_margin;

--Find volume of Sales for the sub categories
SELECT sub_category, COUNT(order_id) AS volume
FROM retail
GROUP BY sub_category
ORDER BY volume DESC;

--Rank Sub-Categories by Profitability Within Each Category
SELECT * 
FROM (
	SELECT category, 
	sub_category, 
	ROUND(SUM(profit)/SUM(sales),4) AS profit_margin,
	RANK() OVER(PARTITION BY category ORDER BY SUM(profit)/SUM(sales) DESC) AS ranked_profit_margin
	FROM retail
	GROUP BY category, sub_category)AS ranked_margin
WHERE ranked_profit_margin <= 3
ORDER BY category, ranked_profit_margin;

-- Create discount brackets to analyze the impact on sales and profit
SELECT CASE
WHEN discount <= 0.10 THEN 'low discount (<=10%)'
WHEN discount > 0.10 AND discount <= 0.20 THEN 'medium discount (11%-20%)'
WHEN discount > 0.20 AND discount <= 0.30 THEN 'high discount (21%-30%)'
ELSE 'very high disocunt (>=31%)'
END AS discount_range,
ROUND(AVG(profit), 2) AS avg_profit,
ROUND(AVG(sales), 2) AS avg_sales
FROM retail
GROUP BY discount_range
ORDER BY avg_profit DESC;
						  
						   

						   
