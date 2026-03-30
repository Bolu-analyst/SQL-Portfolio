# Layoffs Data Cleaning Project

## Objective
Clean and prepare a raw layoffs dataset to ensure data quality and consistency for analysis.

## Key Tasks Performed
- Identified and removed duplicate records using `ROW_NUMBER()`
- Standardized inconsistent text fields (company, industry, country)
- Converted date columns into proper SQL date format
- Handled NULL and missing values through data imputation techniques
- Removed irrelevant or incomplete records

## SQL Techniques Used
- Window Functions (`ROW_NUMBER`)
- CTEs (Common Table Expressions)
- Data transformation (`TRIM`, `STR_TO_DATE`)
- Self-joins for data filling

## Business Value
Clean and structured data enables accurate analysis of layoffs trends, supporting better workforce planning and strategic decision-making.

## Key Outcome
Transformed raw, inconsistent data into a reliable dataset suitable for downstream analysis and reporting.

## Tools Used
- MySQL
