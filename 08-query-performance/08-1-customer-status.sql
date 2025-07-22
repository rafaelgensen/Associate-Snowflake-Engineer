WITH customer_status AS (
	SELECT c.customerid,
  		c.age,
        c.tenure,
        CASE 
            WHEN ch.customerid IS NOT NULL THEN 'Churned' 
            ELSE 'Active' 
        END AS status
    FROM customers AS c
    	LEFT JOIN churn AS ch 
  		ON c.customerid = ch.customerid
    GROUP BY c.customerid, c.age, c.tenure, status
)
SELECT status,
	COUNT(customerid) AS unique_customers,
    -- Calculate averages
    AVG(age) AS average_age,
    AVG(tenure) AS average_tenure
FROM customer_status
WHERE customerid IN (SELECT customerid 
                     FROM customers 
                     WHERE estimatedsalary > 175000)
GROUP BY status
-- Filter data
HAVING average_tenure > 2;

