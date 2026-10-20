--                     ===========================================================
--                          Assignment 2 : Electronic Store Management System
--                     ===========================================================


-- Creating Database For Electronic Store :
CREATE DATABASE Electronic_Store;

-- Creating Tables :
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Returns;


------------------ Creating Customer Table ------------------------

CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Customer_Name VARCHAR(100) NOT NULL,
  Email VARCHAR(150) NOT NULL,
  City VARCHAR(60),
  State VARCHAR(60),
  Signup_Date DATE
);


---------------------- Creating Product Table ---------------------------

CREATE TABLE Products (
  Product_ID INT PRIMARY KEY,
  Product_Name VARCHAR(120) NOT NULL,
  Category VARCHAR(60),
  Unit_Price DECIMAL(10,2),
  Stock_Quantity INT
);


--------------------------- Creating Employee Table ---------------------------

CREATE TABLE Employees (
  Employee_ID INT PRIMARY KEY,
  Employee_Name VARCHAR(100) NOT NULL,
  Department VARCHAR(60),
  Branch_City VARCHAR(60),
  Monthly_Salary DECIMAL(10,2)
);


-------------------------- Creating Order Table --------------------------

CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Customer_ID INT,
  Order_Date DATE,
  Employee_ID INT,
  Order_Status VARCHAR(30),
  Payment_Method VARCHAR(30),
     CONSTRAINT fk_Order_Customer
  		 FOREIGN KEY (Customer_ID) 
 		 REFERENCES Customers(Customer_ID)
		 ON DELETE SET NULL,
	 CONSTRAINT fk_Order_Employee
 		 FOREIGN KEY (Employee_ID) 
		 REFERENCES Employees(Employee_ID)
		 ON DELETE SET NULL
);


------------------------ Creating Order_Items Table --------------------------

CREATE TABLE Order_Items (
  Order_Item_ID INT PRIMARY KEY,
  Order_Id INT,
  Product_ID INT,
  Quantity INT,
  Unit_Price_at_Sale DECIMAL(10,2),
  Discount_Rate DECIMAL(4,2),
  	CONSTRAINT fk_Items_Order
 	   FOREIGN KEY (Order_ID)
	   REFERENCES Orders(Order_ID)
	   ON DELETE CASCADE,
	CONSTRAINT fk_Items_Product
       FOREIGN KEY (Product_ID) 
	   REFERENCES Products(Product_ID)
	   ON DELETE RESTRICT
);


-------------------------- Creating Return Table ------------------------------

CREATE TABLE Returns (
  Return_ID INT PRIMARY KEY,
  Order_ID INT,
  Return_Date DATE,
  Return_Reason VARCHAR(120),
  	 CONSTRAINT fk_Return_Order
    	 FOREIGN KEY (Order_ID)
		 REFERENCES Orders(Order_ID)
		 ON DELETE CASCADE
);




------------------------------------------ Inserting Values ---------------------------------------------------------


-- Customer Table :

INSERT INTO Customers (Customer_ID, Customer_Name, Email, City, State, Signup_Date) VALUES
(1001, 'Aarav Sharma', 'aarav.sharma@example.com', 'Lucknow', 'Uttar Pradesh', '2024-01-15'),
(1002, 'Diya Verma', 'diya.verma@example.com', 'Kanpur', 'Uttar Pradesh', '2024-02-10'),
(1003, 'Kabir Singh', 'kabir.singh@example.com', 'Delhi', 'Delhi', '2023-11-22'),
(1004, 'Meera Patel', 'meera.patel@example.com', 'Jaipur', 'Rajasthan', '2024-03-05'),
(1005, 'Ishaan Gupta', 'ishaan.gupta@example.com', 'Lucknow', 'Uttar Pradesh', '2023-08-19'),
(1006, 'Ananya Rao', 'ananya.rao@example.com', 'Bhopal', 'Madhya Pradesh', '2024-04-12'),
(1007, 'Reyansh Khan', 'reyansh.khan@example.com', 'Delhi', 'Delhi', '2024-05-01'),
(1008, 'Saanvi Joshi', 'saanvi.joshi@example.com', 'Pune', 'Maharashtra', '2023-12-09'),
(1009, 'Vivaan Mishra', 'vivaan.mishra@example.com', 'Lucknow', 'Uttar Pradesh', '2024-06-17'),
(1010, 'Aditi Das', 'aditi.das@example.com', 'Kolkata', 'West Bengal', '2024-07-02'),
(1011, 'Arjun Mehta', 'arjun.mehta@example.com', 'Jaipur', 'Rajasthan', '2023-09-14'),
(1012, 'Myra Nair', 'myra.nair@example.com', 'Mumbai', 'Maharashtra', '2024-08-21');


-- Product Table :

INSERT INTO Products (Product_ID, Product_Name, Category, Unit_Price, Stock_Quantity) VALUES
(201, 'Wireless Mouse', 'Accessories', 799.0, 80),
(202, 'Mechanical Keyboard', 'Accessories', 2499.0, 35),
(203, 'USB-C Hub', 'Accessories', 1899.0, 42),
(204, '27-inch Monitor', 'Displays', 14999.0, 18),
(205, 'Laptop Stand', 'Accessories', 1299.0, 55),
(206, 'Webcam HD', 'Peripherals', 3299.0, 24),
(207, 'Noise-Cancelling Headphones', 'Audio', 5999.0, 20),
(208, 'Bluetooth Speaker', 'Audio', 2199.0, 30),
(209, 'External SSD 1TB', 'Storage', 7499.0, 16),
(210, 'Ergonomic Chair', 'Furniture', 11999.0, 12);


-- Employee Table :

INSERT INTO Employees (Employee_ID, Employee_Name, Department, Branch_City, Monthly_Salary) VALUES
(301, 'Nisha Kapoor', 'Sales', 'Lucknow', 52000),
(302, 'Rahul Bansal', 'Sales', 'Delhi', 58000),
(303, 'Pooja Iyer', 'Support', 'Lucknow', 44000),
(304, 'Karan Malhotra', 'Operations', 'Jaipur', 49000),
(305, 'Sneha Kulkarni', 'Sales', 'Pune', 61000);


-- Order Table :

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Employee_ID, Order_Status, Payment_Method) VALUES
(5001, 1001, '2024-09-02', 301, 'Delivered', 'UPI'),
(5002, 1002, '2024-09-05', 302, 'Delivered', 'Card'),
(5003, 1003, '2024-09-07', 302, 'Returned', 'Card'),
(5004, 1001, '2024-09-15', 301, 'Delivered', 'UPI'),
(5005, 1004, '2024-10-01', 304, 'Delivered', 'Cash'),
(5006, 1005, '2024-10-04', 301, 'Delivered', 'Card'),
(5007, 1006, '2024-10-11', 303, 'Cancelled', 'UPI'),
(5008, 1007, '2024-10-18', 302, 'Delivered', 'Card'),
(5009, 1008, '2024-11-02', 305, 'Delivered', 'Wallet'),
(5010, 1009, '2024-11-10', 301, 'Returned', 'UPI'),
(5011, 1010, '2024-11-15', 304, 'Delivered', 'Card'),
(5012, 1011, '2024-12-01', 304, 'Delivered', 'Cash'),
(5013, 1012, '2024-12-09', 305, 'Delivered', 'Wallet'),
(5014, 1003, '2025-01-05', 302, 'Delivered', 'Card'),
(5015, 1002, '2025-01-12', 302, 'Delivered', 'UPI'),
(5016, 1005, '2025-01-20', 301, 'Delivered', 'Card'),
(5017, 1006, '2025-02-02', 303, 'Delivered', 'UPI'),
(5018, 1007, '2025-02-14', 302, 'Returned', 'Card'),
(5019, 1008, '2025-03-01', 305, 'Delivered', 'Wallet'),
(5020, 1009, '2025-03-15', 301, 'Delivered', 'UPI'),
(5021, 1010, '2025-04-03', 304, 'Cancelled', 'Cash'),
(5022, 1011, '2025-04-22', 304, 'Delivered', 'Card'),
(5023, 1012, '2025-05-07', 305, 'Delivered', 'Wallet'),
(5024, 1004, '2025-05-19', 304, 'Delivered', 'UPI');


-- Order Item Table :

INSERT INTO Order_Items (Order_Item_ID, Order_ID, Product_ID, Quantity, Unit_Price_at_Sale, Discount_Rate) VALUES
(1.0, 5001.0, 201.0, 2.0, 799.0, 0.05),
(2.0, 5001.0, 203.0, 1.0, 1899.0, 0.0),
(3.0, 5002.0, 202.0, 1.0, 2499.0, 0.1),
(4.0, 5002.0, 205.0, 2.0, 1299.0, 0.0),
(5.0, 5003.0, 207.0, 1.0, 5999.0, 0.0),
(6.0, 5004.0, 204.0, 1.0, 14999.0, 0.08),
(7.0, 5004.0, 201.0, 1.0, 799.0, 0.0),
(8.0, 5005.0, 210.0, 1.0, 11999.0, 0.05),
(9.0, 5006.0, 209.0, 1.0, 7499.0, 0.1),
(10.0, 5006.0, 203.0, 2.0, 1899.0, 0.0),
(11.0, 5007.0, 206.0, 1.0, 3299.0, 0.0),
(12.0, 5008.0, 207.0, 1.0, 5999.0, 0.15),
(13.0, 5008.0, 208.0, 2.0, 2199.0, 0.0),
(14.0, 5009.0, 202.0, 1.0, 2499.0, 0.05),
(15.0, 5009.0, 206.0, 1.0, 3299.0, 0.0),
(16.0, 5010.0, 204.0, 1.0, 14999.0, 0.0),
(17.0, 5011.0, 208.0, 3.0, 2199.0, 0.1),
(18.0, 5012.0, 210.0, 1.0, 11999.0, 0.0),
(19.0, 5013.0, 209.0, 2.0, 7499.0, 0.05),
(20.0, 5014.0, 202.0, 2.0, 2499.0, 0.0),
(21.0, 5014.0, 203.0, 1.0, 1899.0, 0.05),
(22.0, 5015.0, 205.0, 1.0, 1299.0, 0.0),
(23.0, 5015.0, 201.0, 3.0, 799.0, 0.1),
(24.0, 5016.0, 204.0, 1.0, 14999.0, 0.05),
(25.0, 5017.0, 206.0, 2.0, 3299.0, 0.0),
(26.0, 5017.0, 208.0, 1.0, 2199.0, 0.0),
(27.0, 5018.0, 207.0, 1.0, 5999.0, 0.0),
(28.0, 5019.0, 209.0, 1.0, 7499.0, 0.1),
(29.0, 5020.0, 203.0, 2.0, 1899.0, 0.0),
(30.0, 5020.0, 201.0, 1.0, 799.0, 0.0),
(31.0, 5021.0, 210.0, 1.0, 11999.0, 0.0),
(32.0, 5022.0, 202.0, 1.0, 2499.0, 0.0),
(33.0, 5022.0, 205.0, 1.0, 1299.0, 0.0),
(34.0, 5023.0, 209.0, 1.0, 7499.0, 0.0),
(35.0, 5024.0, 204.0, 1.0, 14999.0, 0.1),
(36.0, 5024.0, 205.0, 2.0, 1299.0, 0.0);


-- Return Table :

INSERT INTO Returns (Return_ID, Order_ID, Return_Date, Return_Reason) VALUES
(9001, 5003, '2024-09-20', 'Damaged item'),
(9002, 5010, '2024-11-17', 'Changed mind'),
(9003, 5018, '2025-02-20', 'Product not as expected');



------------------ Verifying Data Inserted Succesfully or not ---------------------

Select 
*
From Customers;
----------------------
Select
*
From Products;
----------------------
Select
*
From Employees;
----------------------
Select 
*
From Orders;
----------------------
Select 
*
From Order_Items;
----------------------
Select 
*
From Returns;
----------------------



------------------------------------------- Data Insertion Complete -------------------------------------------------


-- QUERRIES TO PERFORM :

-- Q1. Basic filtering and sorting.
-- List delivered orders placed between 1 October 2024 and 31 March 2025, showing order_id, 
-- order_date, customer_id, and payment_method. Sort by order_date descending. 

Select Customer_ID, Order_ID, Order_Date, Payment_Method
From Orders
Where Order_Status = 'Delivered'
		 		And Order_Date Between '2024-10-01' and '2025-03-31'
Order By Order_Date Desc;

---------------------------------------------------------------------------------------------------------------------


-- Q2. Multi-table JOIN.
-- Display each delivered order with customer_name, order_id, order_date, employee_name, and 
-- order_status. Include only orders with matching customer and employee records. 

Select c.Customer_Name, o.Order_ID, o.Order_Date, o.Order_Status, e.Employee_Name
From Orders o
Join Customers c
	On o.Customer_ID = c.Customer_ID
Join Employees e
	On o.Employee_ID = e.Employee_ID
Where o.Order_Status = 'Delivered'
Order By o.Order_Date;

---------------------------------------------------------------------------------------------------------------------


-- Q3. Aggregation and HAVING. 
-- For each product category, calculate total units sold and net revenue from delivered orders. Show 
-- only categories with net revenue greater than ₹10,000; sort by net revenue descending. 

Select p.Category,
	Sum(oi.Quantity) As Total_Item_Sold,
	Round(Sum(oi.Quantity * oi.Unit_Price_at_Sale * (1 - Discount_Rate)), 2) As Net_Revenue
From Orders o
Join Order_Items oi
	On o.Order_Id = oi.Order_ID
Join Products p
	On oi.Product_ID = p.Product_ID
Where o.Order_Status ='Delivered'
Group By p.Category
	Having Sum(oi.Quantity * oi.Unit_Price_at_Sale * (1 - oi.Discount_Rate)) > 10000
Order By Net_Revenue Desc;

---------------------------------------------------------------------------------------------------------------------


-- Q4. Customers with repeat purchases.
-- Find customers who have placed at least two delivered orders. Show customer_id, customer_name, 
-- number of delivered orders, and total net spend. 

Select c.Customer_ID, c.Customer_Name,
		Count (Distinct o.Order_ID) As Delivered_Orders,
		Round(Sum(oi.Quantity * oi.Unit_Price_at_Sale * (1 - oi.Discount_Rate)),2) As Total_Net_Spend
From Customers c
Join Orders o
	On c.Customer_ID = o.Customer_ID
Join Order_Items oi
	On o.Order_ID = oi.Order_ID
Where o.Order_Status = 'Delivered'
Group By c.Customer_ID, c.Customer_Name
	Having Count(Distinct o.Order_ID) >= 2
Order By Total_Net_Spend Desc;

---------------------------------------------------------------------------------------------------------------------


-- Q5. LEFT JOIN and zero activity.
-- List all customers and the number of delivered orders each has placed, including customers with 
-- zero delivered orders. 

Select c.Customer_ID, c.Customer_Name,
	Count (o.Order_ID) As Number_of_Orders
From Customers c
Left Join Orders o
	On c.Customer_ID = o.Customer_ID
	And o.Order_Status = 'Delivered'
Group By c.Customer_ID, c.Customer_Name
Order By Number_of_Orders;

---------------------------------------------------------------------------------------------------------------------


-- Q6. Subquery.
-- Find products whose unit_price is greater than the average unit_price of all products. Display 
-- product name, category, unit price, and the overall average price. 

Select Product_Name, Category, Unit_Price,
	(Select Round(Avg (unit_Price),2) From Products) As Average_Price
From Products
Where Unit_Price > (Select Round(Avg (unit_Price),2) From Products);

---------------------------------------------------------------------------------------------------------------------


-- Q7. NOT EXISTS.
-- Find customers who have never placed a delivered order. Return their customer_id, customer_name, 
-- and city. 

Select Customer_ID, Customer_Name, City
From Customers
Where Not Exists
	(Select
	 *
	 From Orders
	 Where Order_Status = 'Delivered');

---------------------------------------------------------------------------------------------------------------------


-- Q8. Date functions
-- Group delivered orders by year and month, showing the number of orders and net revenue for each 
-- month. Sort chronologically. 

Select Extract (Month From o.Order_Date) As Months,
	   Extract (Year From o.Order_Date) As Years,
	   Count (Distinct o.Order_ID) As Total_Orders,
	   Round (Sum (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2) As Net_Revenue
From Orders o
Join Order_Items oi
	On o.Order_ID = oi.Order_ID
Where o.Order_Status = 'Delivered'
Group By Extract (Month From o.Order_Date),
	     Extract (Year From o.Order_Date)
Order By Years Asc, Months Asc;
	   
---------------------------------------------------------------------------------------------------------------------


-- Q9. CASE expression
-- Classify each product as 'Low Stock' when stock_quantity < 20, 'Moderate Stock' when 
-- stock_quantity is between 20 and 40 inclusive, and 'High Stock' when stock_quantity > 40. Display 
-- product_name, stock_quantity, and stock label. 

Select Product_Name, Stock_Quantity,
Case When Stock_Quantity < 20 Then 'Low Stock'
     When Stock_Quantity Between 20 And 40 Then 'Moderate Stock'
	 Else 'High Stock' End As Stock_Label
From Products
Order By Stock_Quantity Desc;

---------------------------------------------------------------------------------------------------------------------


-- Q10. Conditional aggregation.
-- For each employee, calculate delivered, returned, and cancelled order counts using conditional 
-- aggregation. Include employees with no orders. 

Select e.Employee_ID, e.Employee_Name,
	Count (Case When o.Order_Status = 'Delivered' Then 1 End) As Delivered_Orders,
	Count (Case When o.Order_Status = 'Cancelled' Then 1 End) As Cancelled_Order,
    Count (Case When o.Order_Status = 'Returned' Then 1 End) As Returned_Order
From Employees e
Left Join Orders o
	On e.Employee_ID = o.Employee_ID
Group By e.Employee_ID, e.Employee_Name
Order By Employee_ID;

---------------------------------------------------------------------------------------------------------------------


-- Q11. Window function – ranking.
-- Rank products within each category by net revenue from delivered orders, highest first. Show 
-- category, product_name, net revenue, and rank. Products with no delivered sales should still be 
-- eligible to appear with zero revenue. 

Select p.Category, p.Product_Name,
	Coalesce (Round(Sum (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2),0) As Net_Revenue,
	Rank() Over(
			Partition By p.Category
					Order By Coalesce (Round(Sum (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2),0)
						 Desc) As Product_Rank
From Products p
Left Join Order_Items oi
	On p.Product_ID = oi.Product_ID
Left Join Orders o
	On oi.Order_ID = o.Order_ID
	And o.Order_Status = 'Delivered'
Where oi.Order_ID Is Null or o.Order_ID Is Not Null
Group By p.Category, p.Product_Name
Order By Net_Revenue Desc; 	

---------------------------------------------------------------------------------------------------------------------


-- Q12. Running total.
-- For each month, calculate delivered-order net revenue and a cumulative running total of revenue 
-- across months in chronological order. 

Select To_Char (o.Order_Date, 'YYYY-MM') As Years_Months,
	   Round(Sum (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2) As Monthly_Net_Revenue,
	   Round(Sum(Sum(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)))
	   		Over(Order By To_Char (o.Order_Date, 'YYYY-MM')
			   Rows Between Unbounded Preceding And Current Row),2) As Running_Total
From Orders o
Join Order_Items oi
	On o.Order_ID = oi.Order_ID
Where o.Order_Status = 'Delivered'
Group By To_Char (o.Order_Date, 'YYYY-MM')
order by Years_Months Asc;
	   
---------------------------------------------------------------------------------------------------------------------


-- Q13. Return analysis. 
-- List each returned order with customer name, return date, return reason, and the total pre-discount 
-- value of its order items. 

Select o.Order_ID, c.Customer_Name, r.Return_Date, r.Return_Reason,
	  Sum (oi.Quantity * oi.Unit_Price_at_Sale) As Pre_Discont_Order_Value
From Returns r
Join Orders o
	On r.Order_ID = o.Order_ID
Join Customers c
	On o.Customer_ID = c.Customer_ID
Join Order_Items oi
	On o.Order_ID = oi.Order_Id
Group By c.Customer_Name, r.Return_Date, r.Return_Reason, o.Order_ID
Order By r.Return_Date Desc;

---------------------------------------------------------------------------------------------------------------------


-- Q14. CTE. 
-- Using a CTE, calculate net revenue per customer from delivered orders, then return customers 
-- whose net revenue is above the average customer net revenue. State whether the average is 
-- calculated across all customers or only customers with delivered purchases. 

With Customer_Revenue As (
Select c.Customer_ID, c.Customer_Name,
		Sum(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)) As Net_Revenue
From Customers c
Join Orders o
	On c.Customer_ID = o.Customer_ID
Join Order_Items oi
	On o.Order_ID = oi.Order_ID 
Where o.Order_Status = 'Delivered'
Group By c.Customer_ID, c.Customer_Name
)
Select Customer_ID, Customer_Name,
    Round(Net_Revenue, 2) AS More_then_Average_Net_Revenue
From Customer_Revenue
Where Net_Revenue > (Select Avg(Net_Revenue) From Customer_Revenue
)
Order By Net_Revenue Desc;

---------------------------------------------------------------------------------------------------------------------


-- Q15. Business insight query.
-- Identify the top three customers by delivered net spend. Show customer name, number of delivered 
-- orders, net spend, and each customer's percentage contribution to total delivered net revenue. 

With Customer_Spend As (
Select c.Customer_ID, c.Customer_Name, 
		Count (Distinct o.Order_ID) As Total_Orders,
		Round(Sum(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2) As Net_Spend
From Customers c
Join Orders o
	On c.Customer_ID = o.Customer_ID
Join Order_Items oi
	On o.Order_ID = oi.Order_ID
Where o.Order_Status = 'Delivered'
Group By c.Customer_ID, c.Customer_Name
),
Customer_Contribution AS (
Select Customer_ID, Customer_Name, Total_Orders,
        Net_Spend,
        100.0 * Net_Spend
            / Sum(Net_Spend) Over () As Revenue_Contribution_Percentage
    From Customer_Spend
)
Select
    Customer_Name,
    Total_Orders,
    Round(Net_Spend, 2) As Net_Spend,
    Round(Revenue_Contribution_Percentage, 2)
        As Revenue_Contribution_Percentage
From Customer_Contribution
Order By Net_Spend Desc
Limit 3;
		
---------------------------------------------------------------------------------------------------------------------
--                         \\\\\\\\\\\\\\\\\\\\\    END    /////////////////////                                                               
---------------------------------------------------------------------------------------------------------------------
