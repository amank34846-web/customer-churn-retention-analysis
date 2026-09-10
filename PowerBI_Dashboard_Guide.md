# Power BI Dashboard Guide

Load `customer_churn_clean_data.xlsx`.

Measures:
Total Customers = DISTINCTCOUNT(customer_churn[Customer_ID])
Churned Customers = CALCULATE([Total Customers], customer_churn[Churn]=1)
Retained Customers = CALCULATE([Total Customers], customer_churn[Churn]=0)
Churn Rate % = DIVIDE([Churned Customers],[Total Customers])
Average Monthly Fee = AVERAGE(customer_churn[Monthly_Fee])
Average Tenure = AVERAGE(customer_churn[Tenure_Months])

Recommended visuals:
1. KPI cards: Total Customers, Churned, Retained, Churn Rate, Average Fee, Average Tenure
2. Churn Rate by Contract Type
3. Churn Rate by Plan
4. Churn Rate by Region
5. Churn Rate by Satisfaction Band
6. Churn Rate by Tenure Band
7. Support Tickets vs Churn
8. Churn Status distribution

Slicers: Region, Plan, Contract Type, Payment Method.
