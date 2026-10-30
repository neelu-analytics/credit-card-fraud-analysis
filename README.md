# credit-card-fraud-analysis
# Credit Card Fraud Analysis

## Project Overview
This project focuses on analyzing credit card transactions to identify fraudulent activities and understand transaction patterns. The analysis uses Excel, SQL, and Power BI to explore fraud trends, compare genuine and fraudulent transactions, and present key findings through dashboards.

## Tools & Technologies
- **Excel:** Data analysis, KPI calculations, and interactive dashboard.
- **SQL:** Data querying, filtering, and fraud analysis.
- **Power BI:** Data visualization and interactive dashboard.

## Dataset
The dataset contains 284,807 credit card transactions with 30 features, including transaction amount, time, anonymized variables (V1–V28), and a class label.

- `Class = 0`: Genuine transaction
- `Class = 1`: Fraudulent transaction

## Key Analysis & Findings
- Total Transactions: 284,807
- Fraudulent Transactions: 492
- Genuine Transactions: 284,315
- Fraud Rate: 0.17%
- Total Fraud Amount: 60,127.97

## Dashboard Highlights
The dashboard explores:
- Fraud rate by hour
- Fraud rate by amount band
- Fraud rate by day
- Average transaction amount: Fraud vs Genuine
- Interactive slicers for filtering transaction data

## Project Files
- `create_table.sql` – SQL table creation
- `data_cleaning.sql` – Data cleaning queries
- `fraud_analysis_queries.sql` – Fraud analysis queries
- `Credit_Card_Fraud_Analysis.xlsx` – Excel analysis and dashboard
- `Credit_Card_Fraud_Analysis.pbix` – Power BI dashboard
- `dashboard_preview.png` – Dashboard screenshot

## Conclusion
The analysis highlights the highly imbalanced nature of credit card transaction data, with fraudulent transactions accounting for approximately 0.17% of all transactions. Excel, SQL, and Power BI were used to analyze transaction patterns and communicate findings through visual dashboards.


