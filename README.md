# Manufacturing Operations Analytics

## Problem
Manufacturing plants face high machine downtime and rising maintenance costs, leading to reduced production efficiency and increased operational expenses.

## Dataset
- 10,000+ records across production, downtime, and maintenance
- Structured using a Star Schema (3 fact tables, 4 dimension tables)
- Includes machine, plant, operator, and product-level data

## Key Metrics
- Production Output (Actual vs Target)
- Downtime (Minutes)
- Maintenance Cost
- Rejection Rate

## Key Insight
Top 20% of machines contribute to the majority of downtime and maintenance costs, indicating strong cost concentration.

## Root Cause
Aging machines and reactive maintenance → higher downtime → increased maintenance cost → reduced production efficiency

## Business Impact
- Preventive maintenance reduces downtime compared to reactive maintenance
- Older machines show higher failure rates
- Operator performance significantly impacts output and defect rates

## Recommendations
- Shift high-cost machines to preventive maintenance strategy
- Prioritize replacement of aging machines
- Assign top-performing operators to critical machines

## Tools Used
- SQL (MySQL)
- Python (Pandas)
- Power BI

