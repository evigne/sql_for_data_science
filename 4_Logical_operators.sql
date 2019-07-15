-- Questions using the LIKE operator
-- Use the accounts table to find

-- 1 All the companies whose names start with 'C'. 
SELECT name FROM accounts
WHERE name LIKE 'C%';
-- 2 All companies whose names contain the string 'one' somewhere in the name.
SELECT name FROM accounts
WHERE name LIKE '%one%';
--3  All companies whose names end with 's'.
SELECT name FROM accounts
WHERE name LIKE '%s';

--------------------------------------------------------------
-- Questions using IN operator
--1 Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

--2 Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

--------------------------------------------------
-- The NOT operator is an extremely useful operator for working with the previous
--  two operators we introduced: IN and LIKE. By specifying NOT LIKE or NOT IN,
--   we can grab all of the rows that do not meet a particular criteria.

---------------------------------------------
-- Questions using AND and BETWEEN operators
-- 1 Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT * FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty =0;
-- 2 Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT * FROM accounts
WHERE name NOT LIKE 'C%' AND name NOT LIKE '%s';
--3  When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.
SELECT occurred_at, gloss_qty 
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;
-- 4 Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND 
occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

--------------------------------------------------------------
-- Questions using the OR operator
-- 1 Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

--2 Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT id FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

--3 Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%');