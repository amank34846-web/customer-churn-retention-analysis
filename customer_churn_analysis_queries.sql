CREATE DATABASE IF NOT EXISTS churn_project;
USE churn_project;

-- Overall KPIs
SELECT COUNT(*) total_customers, SUM(Churn) churned_customers,
COUNT(*)-SUM(Churn) retained_customers,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct,
ROUND(AVG(Monthly_Fee),2) avg_monthly_fee,
ROUND(AVG(Tenure_Months),2) avg_tenure_months
FROM customer_churn;

-- Churn by contract
SELECT Contract_Type,COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY Contract_Type ORDER BY churn_rate_pct DESC;

-- Churn by plan
SELECT Plan,COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY Plan ORDER BY churn_rate_pct DESC;

-- Churn by region
SELECT Region,COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY Region ORDER BY churn_rate_pct DESC;

-- Satisfaction bands
SELECT CASE WHEN Satisfaction_Score<2.5 THEN 'Low'
WHEN Satisfaction_Score<3.5 THEN 'Medium' ELSE 'High' END satisfaction_band,
COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY satisfaction_band ORDER BY churn_rate_pct DESC;

-- Tenure bands
SELECT CASE WHEN Tenure_Months<=6 THEN '0-6 Months'
WHEN Tenure_Months<=12 THEN '7-12 Months'
WHEN Tenure_Months<=24 THEN '13-24 Months'
ELSE '25+ Months' END tenure_band,
COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY tenure_band ORDER BY churn_rate_pct DESC;

-- Support-ticket bands
SELECT CASE WHEN Support_Tickets=0 THEN '0'
WHEN Support_Tickets<=2 THEN '1-2'
WHEN Support_Tickets<=4 THEN '3-4' ELSE '5+' END ticket_band,
COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY ticket_band ORDER BY churn_rate_pct DESC;

-- Discount vs churn
SELECT Discount_Pct,COUNT(*) customers,SUM(Churn) churned,
ROUND(SUM(Churn)/COUNT(*)*100,2) churn_rate_pct
FROM customer_churn GROUP BY Discount_Pct ORDER BY Discount_Pct;
