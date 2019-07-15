
--SELECT => indicates which column
--FROM => indiacates from which table
SELECT * FROM orders; -- * means all

SELECT id, account_id FROM orders;

-- LIMIT => limits the number of rows that to be displayed
SELECT occurred_At, account_id, channel FROM web_events LIMIT 15;

--Let's get some practice using ORDER BY:

--1.Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd FROM orders ORDER BY occurred_at DESC
LIMIT 10;

--2.Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd FROM orders ORDER BY total_amt_usd DESC
LIMIT 5;

--3.Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd FROM orders ORDER BY total_amt_usd
LIMIT 20;

