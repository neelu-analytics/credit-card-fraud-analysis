--Row Count
SELECT COUNT (*)as total_row, SUM("Class") as Fraud_row
from creditcard;

--Missing values
SELECT COUNT (*) FILTER (WHERE "Time" is NULL) AS null_time,
COUNT (*) FILTER (WHERE "Amount" is NULL) AS null_amount,
COUNT (*) FILTER (WHERE "Class" is NULL) AS null_class
From creditcard;

--Does class contain only valid value
SELECT "Class",  count(*) AS rows_count
from creditcard
Group by "Class"
Order by "Class";

-- Invaild amounts
SELECT COUNT(*) Filter (where "Amount" <0) as negative_amounts,
 COUNT(*) Filter (where "Amount" =0) as zero_amounts,
 COUNT(*) Filter (where "Amount" =0 and "Class" =1) as zero_amount_fraud
 from creditcard;

--Time range
SELECT MIN("Time") AS min_sec, MAX("Time") AS max_sec,
ROUND((MAX("Time") / 3600)::numeric, 1) AS total_hours
FROM creditcard;

--Duplicate
SELECT COUNT(*) AS duplicate_group,
sum(cnt-1) as extra_copies
from(select COUNT(*) AS cnt
from creditcard
group by "Time", "V1", "V2", "Amount", "Class"
Having Count(*)>1
) AS duplicates;





 




