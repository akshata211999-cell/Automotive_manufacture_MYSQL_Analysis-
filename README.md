# Automotive Manufacturing Data Analysis using MySQL
## Project Overview
This project focuses on analyzing an Automotive Manufacturing dataset using MySQL. The analysis explores supplier performance, manufacturing costs, order quantities, delivery timelines, and product quality through SQL queries.
The project demonstrates practical SQL skills, including data filtering, aggregation, date functions, and advanced window functions.
## Project Objectives
- Analyze automotive manufacturing orders.
- Identify suppliers and their order performance.
- Calculate total manufacturing costs.
- Analyze delayed deliveries and defective quantities.
- Rank orders based on total cost and quantity.
- Identify top-performing suppliers and high-cost orders.

## Tools & Technologies
- MySQL
- SQL
- MySQL Workbench
- GitHub
## Dataset Description
The dataset contains automotive manufacturing order information with the following columns:

| Column Name | Description |
|---|---|
| Order_ID | Unique order identification |
| Supplier_ID | Supplier identification |
| Supplier_Name | Name of the supplier |
| Part_ID | Unique part identification |
| Part_Name | Name of the manufactured part |
| Part_Category | Category of the part |
| Material | Material used |
| Order_Date | Date of order placement |
| Required_Date | Expected delivery date |
| Delivery_Date | Actual delivery date |
| Ordered_Qty | Total quantity ordered |
| Delivered_Qty | Total quantity delivered |
| Unit_Cost | Cost per unit |
| Total_Cost | Total order cost |
| Defect_Qty | Number of defective parts |
| Lead_Time_Days | Order lead time |
| On_Time | Delivery status |
| Quality_Status | Quality inspection status |
| Warehouse_ID | Warehouse identification |
| Warehouse | Warehouse name |
| Region | Geographical region |

## SQL Concepts Covered

### 1. Basic SQL Queries
- SELECT
- DISTINCT
- WHERE
- AND / OR / NOT
- IN
- BETWEEN
- LIKE
- ORDER BY
- LIMIT

### 2. Aggregate Functions
- COUNT()
- SUM()
- AVG()
- GROUP BY
- HAVING

### 3. String and Date Functions
- UPPER()
- YEAR()
- MONTH()
- STR_TO_DATE()
- DATEDIFF()

### 4. Window Functions

**ROW_NUMBER()**
- Assign unique row numbers to orders.
- Generate row numbers separately for each supplier.
- Identify the latest order for each supplier.

**RANK()**
- Rank orders based on total manufacturing cost.
- Rank suppliers based on average lead time.
- Rank order quantities within each region.

**DENSE_RANK()**
- Find the second-highest order cost.
- Identify the top three highest-cost orders for each supplier.
  
## Business Questions Analyzed
1. What is the total manufacturing cost?
2. Which suppliers have the highest order costs?
3. How many orders were delivered on time?
4. Which part categories have the highest defective quantities?
5. Which orders have delivery quantities below ordered quantities?
6. Which suppliers have higher average lead times?
7. What are the five most expensive orders?
8. Which are the top three highest-cost orders for each supplier?
9. What is the second-highest order cost?
10. How do order costs vary across suppliers?
## Example SQL Queries
### 1. Rank orders based on total cost
```sql
SELECT
    Order_ID,
    Total_Cost,
    RANK() OVER(
        ORDER BY Total_Cost DESC
    ) AS Cost_Rank
FROM automotive_manufacture;
```
### 2. Find the second-highest order cost
```sql
SELECT *
FROM (
    SELECT
        Order_ID,
        Total_Cost,
        DENSE_RANK() OVER(
            ORDER BY Total_Cost DESC
        ) AS Cost_Rank
    FROM automotive_manufacture
) AS Ranked_Orders
WHERE Cost_Rank = 2;
```
### 3. Find the top three highest-cost orders for each supplier
```sql
SELECT *
FROM (
    SELECT
        Supplier_Name,
        Order_ID,
        Total_Cost,
        DENSE_RANK() OVER(
            PARTITION BY Supplier_Name
            ORDER BY Total_Cost DESC
        ) AS Cost_Rank
    FROM automotive_manufacture
) AS Ranked_Orders
WHERE Cost_Rank <= 3;
```
## Project Learning Outcomes
- Developed practical experience in MySQL.
- Improved understanding of SQL window functions.
- Practiced supplier-wise and region-wise analysis.
- Learned to analyze manufacturing costs and delivery performance.
- Applied SQL concepts to real-world business questions.
## Conclusion
This project demonstrates how SQL can be used to analyze automotive manufacturing operations, evaluate supplier performance, identify delivery issues, and understand manufacturing costs.
It helped strengthen my practical knowledge of MySQL, especially advanced SQL concepts and window functions.
Project Category: Data Analytics | SQL Analysis
Author: Akshata Pattar

**Project Category:** Data Analytics | SQL Analysis

**Author:** Akshata Pattar
