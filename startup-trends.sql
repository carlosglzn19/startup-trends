-- It’s your first day as a TechCrunch reporter. Your first task is to write an article on the rising trends in the startup world.

-- Getting started, take a look at the startups table:

SELECT *
FROM startups;

-- Calculate the total number of companies in the table.

SELECT COUNT(*) AS number_companies
FROM startups;

-- We want to know the total value of all companies in this table.

SELECT SUM(valuation) AS total_value
FROM startups;

--  What is the highest amount raised by a startup?

SELECT MAX(raised) AS max_raised
FROM startups;

-- Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.

SELECT MAX(raised) AS max_raised_seed
FROM startups
WHERE stage = 'Seed';

-- In what year was the oldest company on the list founded?

SELECT MIN(founded) AS oldest_fouded_year
FROM startups;

-- Return the average valuation.

SELECT AVG(valuation)
FROM startups;

-- Return the average valuation, in each category.

SELECT category,
       AVG(valuation) AS average_valuation
FROM startups
GROUP BY category
ORDER BY average_valuation DESC;

-- Return the average valuation, in each category.Round the averages to two decimal places.
--Lastly, order the list from highest averages to lowest.

SELECT category,
       ROUND(AVG(valuation), 2) AS average_valuation
FROM startups
GROUP BY category
ORDER BY average_valuation DESC;

-- Return the name of each category with the total number of companies that belong to it

SELECT category,
       COUNT(*) AS number_companies
FROM startups
GROUP BY category
ORDER BY number_companies DESC;

-- Next, filter the result to only include categories that have more than three companies in them.

SELECT category,
       COUNT(*) AS number_companies
FROM startups
GROUP BY category
HAVING number_companies > 3
ORDER BY 2 DESC;

-- What is the average size of a startup in each location?

SELECT location,
       AVG(employees) AS avg_size
FROM startups
GROUP BY location
ORDER BY 2 DESC;

-- What is the average size of a startup in each location, with average sizes above 500?

SELECT location,
       AVG(employees) AS avg_size
FROM startups
GROUP BY location
HAVING avg_size > 500
ORDER BY 2 DESC;