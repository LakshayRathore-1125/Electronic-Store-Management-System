# Electronic-Store-Management-System

Developed a relational database project for an Electronic Store to analyze sales performance, customer purchasing behavior, product revenue, inventory levels, employee performance, and product returns using PostgreSQL. Designed and populated a structured database consisting of six interconnected tables: Customers, Products, Employees, Orders, Order_Items, and Returns.

Applied SQL techniques, including multi-table joins, aggregate functions, subqueries, Common Table Expressions (CTEs), conditional aggregation, CASE expressions, date functions, and window functions, to extract meaningful business insights from transactional data.

The analysis focused on calculating net revenue after discounts, identifying repeat and high-value customers, tracking monthly revenue and cumulative growth, ranking products by category, monitoring stock levels, analyzing returned orders, and evaluating employee order performance.

The project demonstrates practical SQL skills in relational data analysis, revenue reporting, customer segmentation, and business intelligence, supporting data-driven decision-making for retail operations.
___________________________________________________________________________________________________________________________

**Key Skills Demonstrated**

- Database Management: Relational database design, primary keys, foreign keys, and referential integrity.
- SQL Querying: Filtering, sorting, joins, grouping, aggregation, and HAVING clauses.
- Advanced SQL: CTEs, subqueries, window functions, ranking, and running totals.
- Sales Analytics: Net revenue calculation, monthly sales trends, and revenue contribution analysis.
- Customer Analytics: Repeat purchase identification, customer spending analysis, and high-value customer identification.
- Operational Analytics: Inventory classification, employee performance analysis, and return analysis.
___________________________________________________________________________________________________________________________

**🎯 Business Objectives**

- Analyze delivered-order revenue and monthly sales performance. 
- Identify high-value customers and customers with repeat purchases.
- Rank products by net revenue within their respective categories.
- Calculate monthly revenue and cumulative running totals.
- Evaluate product inventory levels and identify low-stock products.
- Analyze employee performance based on order statuses.
- Examine returned orders and calculate their pre-discount values.
- Measure customer contributions to total delivered net revenue.
___________________________________________________________________________________________________________________________

**🗄️ Database Schema**

The project consists of six relational tables:
___________________________________________________________________________________________________________________________

**Table	Description**

- Customers	Stores customer details, location, email, and signup date.
- Products	Contains product names, categories, prices, and stock quantities.
- Employees	Stores employee information, departments, branch locations, and salaries.
- Orders	Records customer orders, order dates, assigned employees, order statuses, and payment methods.
- Order_Items	Contains product-level transaction details, including quantity, sale price, and discount rate.
- Returns	Stores return dates and reasons associated with returned orders.
- Relationships
- Each customer can place multiple orders.
- Each employee can handle multiple orders.
- Each order can contain multiple order items.
- Each product can appear in multiple order items.
- Each order can have associated return records.
- Primary keys and foreign keys establish relationships and maintain referential integrity between tables.
___________________________________________________________________________________________________________________________

**🛠️ Technologies Used**

- Database: PostgreSQL
- Query Language: SQL
- Tools: PostgreSQL-compatible SQL editor, such as pgAdmin or DBeaver
- Concepts: Relational Database Design, Data Aggregation, Business Analytics, and Advanced SQL
___________________________________________________________________________________________________________________________

**📊 SQL Concepts Implemented**

This project demonstrates the following SQL concepts:

- Basic filtering and sorting using WHERE, BETWEEN, and ORDER BY
- Multi-table joins using INNER JOIN and LEFT JOIN
- Aggregate functions such as SUM(), COUNT(), and AVG()
- Grouping and filtering aggregated results using GROUP BY and HAVING
- Subqueries and NOT EXISTS
- Date functions using DATE_TRUNC()
- Conditional logic using CASE
- Conditional aggregation using FILTER
- Common Table Expressions (CTEs)
- Window functions using RANK() and SUM() OVER()
- Running totals and cumulative revenue calculations
- Revenue contribution percentages and customer ranking
___________________________________________________________________________________________________________________________

**💼 Business Questions Answered**

The project addresses 15 business questions:

- Order Filtering: Retrieve delivered orders within a specified date range.
- Order Details: Display delivered orders with customer and employee information.
- Category Performance: Calculate total units sold and net revenue by product category.
- Repeat Customers: Identify customers with at least two delivered orders.
- Customer Activity: List all customers, including those without delivered orders.
- Product Pricing: Identify products priced above the average product price.
- Customer Retention: Find customers who have never placed a delivered order.
- Monthly Sales: Calculate monthly delivered-order counts and net revenue.
- Inventory Classification: Categorize products by stock availability.
- Employee Performance: Calculate delivered, returned, and cancelled order counts per employee.
- Product Ranking: Rank products within each category by delivered net revenue.
- Revenue Growth: Calculate monthly revenue and cumulative running totals.
- Return Analysis: Analyze returned orders and their pre-discount item values.
- Customer Revenue Analysis: Identify customers whose net revenue exceeds the average among customers with delivered
  purchases.
- Top Customers: Identify the top three customers by delivered net spend and calculate their contributions to total
  delivered net revenue.
___________________________________________________________________________________________________________________________

**💰 Revenue Calculation**

Net revenue is calculated using the quantity sold, the sale price recorded at the time of the transaction, and the applicable discount.

_Formula:_


- Quantity * Unit_Price_at_Sale * (1 - Discount_Rate)
- For example, if a product has a sale price of ₹1,000, a quantity of 2, and a discount rate of 10%, the net revenue is ₹1,800.

Revenue calculations use Unit_Price_at_Sale rather than the current product price to reflect the transaction price.
___________________________________________________________________________________________________________________________

**📈 Key Analytical Outcomes**

The queries are designed to generate insights into:

- Monthly and cumulative delivered revenue trends.
- Product and category revenue performance.
- Customer spending patterns and repeat purchases.
- High-value customers and their revenue contributions.
- Inventory availability and stock classification.
- Employee order-status performance.
- Returned-order values and return reasons.
- These analyses can help stakeholders understand sales performance and identify opportunities to improve retail
  operations.
___________________________________________________________________________________________________________________________

**📁 Project Structure**

A suggested repository structure is:


- Electronic-Store-Sales-Analysis/
-  │
-  ├── README.md
-  ├── electronic_store.sql
-  └── queries/
-    ├── Q01_basic_filtering.sql
-    ├── Q02_multi_table_joins.sql
-    ├── Q03_category_revenue.sql
-    ├── Q04_repeat_customers.sql
-    ├── Q05_customer_activity.sql
-    ├── Q06_average_product_price.sql
-    ├── Q07_customers_without_delivered_orders.sql
-    ├── Q08_monthly_sales.sql
-    ├── Q09_inventory_classification.sql
-    ├── Q10_employee_performance.sql
-    ├── Q11_product_ranking.sql
-    ├── Q12_running_total.sql
-    ├── Q13_return_analysis.sql
-    ├── Q14_customer_revenue_cte.sql
-    └── Q15_top_customers.sql
Note: This is a recommended structure. Adjust the filenames to match the files included in your repository.
___________________________________________________________________________________________________________________________

**📝 Assumptions and Limitations**

- The Order_Status field represents the current status of each order.
- Only orders currently marked Delivered contribute to delivered net revenue.
- Discount rates are stored as decimal values, such as 0.10 for a 10% discount.
- Net revenue is calculated after discounts and before separately recorded refunds, taxes, or shipping charges.
- The Returns table stores return dates and reasons but does not contain refund amounts.
- Returned orders are excluded from delivered revenue based on their current order status.
- The dataset is sample data intended for SQL practice and analytical demonstrations.
- The analysis uses SQL queries; a separate visualization dashboard is not included unless added independently.
___________________________________________________________________________________________________________________________

**🎓 Skills Demonstrated**

- PostgreSQL and advanced SQL querying
- Relational database design and data integrity
- Sales and revenue analysis
- Customer segmentation and purchasing behavior
- Inventory and operational analysis
- Data aggregation and analytical reporting
- Business problem-solving using SQL
___________________________________________________________________________________________________________________________

**🔮 Future Enhancements**

Potential improvements include:

- Building an interactive sales dashboard using Power BI or Tableau.
- Adding monthly and category-level revenue visualizations.
- Incorporating refund amounts to calculate revenue net of returns.
- Developing customer segmentation based on spending and purchase frequency.
- Analyzing sales by city, payment method, and employee.
- Automating recurring sales reports.
___________________________________________________________________________________________________________________________

**👤 Author**

Lakshay Rathore

Aspiring Data Analyst | PostgreSQL | SQL | Data Analytics
___________________________________________________________________________________________________________________________

- **GitHub:** LakshayRathore-1125
- **LinkedIn:** https://www.linkedin.com/in/lakshay-rathore-403782425 

⭐ If you find this project useful, feel free to star the repository.
___________________________________________________________________________________________________________________________
