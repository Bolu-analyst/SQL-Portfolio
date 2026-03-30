# World Life Expectancy Analysis Project

## Objective
Analyze global life expectancy trends and identify key factors influencing longevity across countries.

## Data Preparation
- Removed duplicate records using `ROW_NUMBER()`
- Standardized categorical fields such as development status
- Handled missing life expectancy values using neighboring year averages
- Cleaned and formatted data for consistency

## Key Analysis Performed
- Measured life expectancy growth over time for each country
- Compared life expectancy across developed and developing nations
- Analyzed relationship between GDP and life expectancy
- Evaluated health indicators such as BMI and adult mortality

## SQL Techniques Used
- Window functions (`ROW_NUMBER`, rolling calculations)
- Self-joins for data imputation
- Aggregations (`AVG`, `SUM`)
- Conditional logic (`CASE WHEN`)
- Data cleaning techniques

## Key Insights
- Countries with higher GDP tend to have significantly higher life expectancy  
- Developed countries show more stable and consistently high life expectancy  
- Developing countries exhibit greater variability and growth potential  
- Improvements in economic conditions are strongly associated with increases in life expectancy  

## Business / Analytical Value
This analysis highlights the relationship between economic development and health outcomes, providing insights useful for policymakers, global organizations, and strategic planning.

## Key Outcome
Developed a clean, reliable dataset from incomplete global health data and generated insights highlighting the strong relationship between economic development and life expectancy across countries.
