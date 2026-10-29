--Q1. what are the total transactions, the number of fraud and the fraud rate?
SELECT COUNT(*) AS total_transactions,
SUM("Class") AS fraud_transactions,
Round((100.0* SUM("Class")/ COUNT(*))::numeric, 2) AS fraud_rate_percentage
from creditcard;

--Q2. What is the average and maximum amount for fraud vs genuine transactions?
SELECT "Class",
Count (*) AS transactions,
ROUND(AvG("Amount")::numeric, 2) AS avg_amt,
ROUND(MAX("Amount"):: numeric, 2) AS max_amt
from creditcard
GROUP BY "Class"
ORDER BY "Class";

--Q3. Which 5 hours have the highest fraud rate?
SELECT FLOOR ("Time" / 3600):: int % 24 AS hr,
COUNT(*) AS transactions,
SUM("Class") AS fraud,
ROUND((100.0 * SUM("Class") / COUNT(*))::numeric, 2) AS rate_pct
from creditcard
GROUP BY hr
ORDER BY rate_pct DESC
LIMIT 5;

--Q4. How does the fraud rate change across amount bands?
SELECT CASE WHEN "Amount" < 10 THEN '1) Unser 10'
WHEN "Amount" < 100 THEN '2) Unser 10-100'
WHEN "Amount" < 500 THEN '3) Unser 100-500'
WHEN "Amount" < 1000 THEN '4) Unser 500-1000'
ELSE '5) 1000+' END AS band,
COUNT(*) AS transactions,
SUM("Class") AS fraud,
 ROUND((100.0 * SUM("Class") / COUNT(*))::numeric, 2) AS rate_pct
FROM creditcard
GROUP BY band
ORDER BY band;

--Q5. How many fraud hapend on Day 1 vs Day 2?
SELECT CASE WHEN "Time" <86400 THEN 'Day 1' ELSE 'Day 2' END AS day_no,
COUNT(*) AS transactions,
SUM("Class") AS fraud,
ROUND((100.0 * SUM("Class") / COUNT (*))::numeric, 2) AS rate_pct
FROM creditcard
GROUP BY day_no
ORDER BY day_no;

-- Q6. What are the 5 largest fraud transactions?
SELECT "Time", "Amount"
FROM creditcard
WHERE "Class" = 1
ORDER BY "Amount" DESC
LIMIT 5;

-- Q7. What share of the total transaction value is fraud?
SELECT ROUND(SUM("Amount") FILTER (WHERE "Class" = 1)::numeric, 2) AS fraud_amt,
       ROUND(SUM("Amount")::numeric, 2) AS total_amt,
       ROUND((100.0 * SUM("Amount") FILTER (WHERE "Class" = 1) / SUM("Amount"))::numeric, 2) AS fraud_pct
FROM creditcard;

-- Q8. Which hours have 20 or more fraud transactions?
SELECT FLOOR ("Time" / 3600):: integer % 24 AS hour,
COUNT(*) AS fraud_transactions
FROM creditcard
WHERE "Class" = 1
GROUP BY FLOOR("Time" / 3600):: integer %24
HAVING COUNT(*) >=20
ORDER BY fraud_transactions DESC;

--Q9. How many fraud transactions habe an amount below 10?
SELECT COUNT (*) AS fraud_under_10
FROM creditcard
WHERE "Class" = 1
AND "Amount" <10;

--Q10. How many fraud transactions are above the average fraud amount?
SELECT COUNT(*) AS fraud_above_avg
FROM creditcard
WHERE "Class" = 1 AND "Amount" > (
SELECT AVG ("Amount")
FROM creditcard
WHERE "Class" = 1);

















 