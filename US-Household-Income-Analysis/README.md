# US Household Income Analysis Project

## Objective
Analyze income distribution across U.S. states and identify regional differences in household income levels.

## Data Preparation
- Cleaned inconsistent state name entries
- Removed duplicate records using `ROW_NUMBER()`
- Standardized categorical fields
- Ensured data consistency for accurate analysis

## Key Analysis Performed
- Calculated average household income by state
- Compared mean and median income across regions
- Identified top and bottom performing states
- Analyzed income distribution across different area types

## SQL Techniques Used
- Joins between datasets
- Aggregations (`AVG`, `SUM`)
- Window functions
- Data cleaning techniques

## Key Insights
- Income levels vary significantly across states  
- Certain states consistently show higher average income levels  
- Differences between mean and median income highlight income inequality in some regions  
- Urban areas tend to have higher income levels compared to rural regions  

## Business / Analytical Value
This analysis highlights regional income disparities, providing insights useful for economic policy, market analysis, and targeted financial decision-making.

## Key Outcome
Transformed raw income data into a structured dataset and identified key regional income patterns useful for economic and policy analysis.

## Tools Used
- MySQL
