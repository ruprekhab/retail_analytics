CREATE TABLE retail(
order_id VARCHAR(10) PRIMARY KEY,
	customer_name VARCHAR(15),
	category VARCHAR(15),
	sub_category VARCHAR(30),
	city VARCHAR(20),
	order_date DATE,
	region VARCHAR(10),
	sales NUMERIC,
	discount FLOAT,
	profit FLOAT,
	state VARCHAR(40)
);

