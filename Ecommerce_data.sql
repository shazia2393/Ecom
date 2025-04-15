Create Table Customer_data(customer_id VARCHAR(20)) PRIMARY KEY,
					gender VARCHAR(50) NOT NULL,
					age NUMERIC,
					payment_method VARCHAR(50) NOT NULL
					);

Select * from Customer_data

-- If the table already exists:
ALTER TABLE customer_data
ALTER COLUMN customer_id TYPE VARCHAR(20);

Create Table Sale_data(invoice_no VARCHAR(20) UNIQUE,
						customer_id VARCHAR(50) Not Null,
						category VARCHAR(50),
						quantity NUMERIC,
						price NUMERIC,
						invoice_date date,
						shopping_mall VARCHAR(50)
						);

Select*from Sale_data
--Total Revenue by Shopping Mall
SELECT SUM(quantity * price) AS total_revenue FROM sale_data;

--Total Revenue by Category
SELECT category, SUM(quantity * price) AS total_revenue
FROM sale_data
GROUP BY category
ORDER BY total_revenue DESC;

--Total Revenue by Invoice Date
SELECT invoice_date, 
       SUM(quantity * price) AS total_revenue
FROM sale_data
GROUP BY invoice_date
ORDER BY invoice_date;

-- Total Revenue by Customer
SELECT customer_id, 
       SUM(quantity * price) AS total_revenue
FROM sale_data
GROUP BY customer_id
ORDER BY total_revenue DESC;

--Total Revenue by Shopping Mall
SELECT shopping_mall, 
       SUM(quantity * price) AS total_revenue
FROM sale_data
GROUP BY shopping_mall
ORDER BY total_revenue DESC;
--What is the most popular product category in terms of sales?
SELECT category, 
       SUM(quantity) AS total_units_sold
FROM sale_data
GROUP BY category
ORDER BY total_units_sold DESC
LIMIT 1;

--What are the three top shopping malls in terms of sales revenue?
SELECT shopping_mall, SUM(quantity * price) AS total_revenue FROM sale_data
GROUP BY shopping_mall
ORDER BY total_revenue DESC
LIMIT 3;

--What is the gender distribution across different product categories
SELECT age, 
       gender, 
       COUNT(*) AS total_transactions
FROM Customer_data
GROUP BY age, gender
ORDER BY age, gender;

--What is the age distribution of customers who prefer each payment method?

SELECT payment_method, 
       age,
       COUNT(*) AS customer_count
FROM customer_data
GROUP BY payment_method, age
ORDER BY payment_method, age;
