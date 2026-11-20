create database Automotive;
use Automotive;
select * from automotive_manufacture;

#Display all records from the automotive manufacturing table.
select * from automotive_manufacture;

#Display only Order_ID, Supplier_Name, Part_Name and Total_Cost.
select Order_ID, Supplier_Name, Part_Name, Total_Cost
from automotive_manufacture;

#Find all unique supplier names using DISTINCT.
select  distinct Supplier_Name
from automotive_manufacture;

#Find orders where Region = 'South'.
select Region
from automotive_manufacture
where Region = 'South';

#Find orders where Total_Cost is greater than 50,000.
select Total_Cost
from automotive_manufacture
where Total_Cost > 50000;

#Find orders where On_Time = 'Yes'.
select On_Time
from automotive_manufacture
where On_Time = 'Yes';

#Find orders where Quality_Status = 'Fail'.
select Quality_Status
from automotive_manufacture
where Quality_Status = 'Fail';

#Find orders where Ordered_Qty is between 100 and 500.
select Ordered_Qty 
from automotive_manufacture
where Ordered_Qty between 100 and 500;

#Find records where Region is either South or North using IN.
select Region 
from automotive_manufacture
where Region IN ('South' , 'North');

#Find suppliers whose names start with the letter 'M' using LIKE.
select Supplier_Name
from automotive_manufacture 
where Supplier_Name like 'M%';

#Find orders where delivered quantity is less than ordered quantity.
select Ordered_Qty , Delivered_Qty
from automotive_manufacture
where Ordered_Qty > Delivered_Qty;

#Find orders where defect quantity is greater than 10.
select Defect_Qty 
from automotive_manufacture
where Defect_Qty > 10;

#Display orders that are not delivered on time using NOT.
select On_TIme
from automotive_manufacture 
where NOT On_Time = 'Yes';

#Find orders where Total_Cost is greater than 50,000 AND Quality_Status = 'Pass'.
select Total_Cost, Quality_Status
from automotive_manufacture 
where Total_Cost > 50000 and 
Quality_Status = 'Pass';

#Display all orders sorted by Total_Cost from highest to lowest.
select Total_Cost
from automotive_manufacture 
order by Total_Cost desc;

#Find the top 5 most expensive orders using LIMIT.
select Total_Cost 
from automotive_manufacture 
order by Total_Cost desc
limit 5;

#Find the lowest 5 lead-time orders.
select Lead_Time_Days
from automotive_manufacture
order by Lead_Time_Days
limit 5;

#Count the total number of orders using COUNT().
select count(*) AS Total_Order 
from automotive_manufacture;

#Calculate the total manufacturing cost using SUM()
select sum(Total_Cost) AS Total_Manufacture
from automotive_manufacture;

#Find the average order cost using AVG().
select avg(Total_Cost) AS Total_Average
from automotive_manufacture;

#Count how many orders were delivered on time.
select On_Time, count(*) AS Total_Delivered
from automotive_manufacture
where On_Time = 'Yes'
group by On_Time;

#Find the total number of orders for each supplier.
select  Supplier_Name,count(*) AS Total_Orders
from automotive_manufacture
group by Supplier_Name;

#Find the total defective quantity for each part category.
select Part_Category, sum(Defect_Qty) AS Total_Defect
from automotive_manufacture
group by Part_Category;

#Display suppliers whose total order cost is greater than 1,00,000 using HAVING.
select Supplier_Name, Sum(Total_Cost) AS Total_Orders 
from automotive_manufacture
group by Supplier_Name
having Total_Orders > 100000;

#Display supplier names in uppercase using UPPER().
select upper(Supplier_Name) AS Uppercase_using
from automotive_manufacture;

#Extract the year from Order_Date using YEAR().
SELECT
    Order_ID,
    Order_Date,
    year(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Order_year
FROM automotive_manufacture;

#Extract the month from Order_Date using MONTH().
SELECT
    Order_ID,
    Order_Date,
    month(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Order_month
FROM automotive_manufacture;


#Calculate the difference between Order_Date and Delivery_Date using DATEDIFF().
select Order_Date, Delivery_Date,
datediff(
STR_TO_DATE(Delivery_Date,'%d-%m-%Y'),
STR_TO_DATE(Order_Date,'%d-%m-%Y')) AS Delivery_Days
from automotive_manufacture;

#Row_Number
#Assign a unique row number to all orders.
select 
Order_ID, Supplier_Name,
row_number() over(order by Order_ID) AS Row_Num
from automotive_manufacture;

#Assign row numbers to orders based on Total_Cost from highest to lowest.
select 
Order_ID, Total_Cost,
row_number() over(
order by Order_ID desc)  AS Row_Num
from automotive_manufacture;

#Assign row numbers separately for each supplier based on total cost.
select Supplier_Name,
Total_Cost,
row_number() over(
partition by Supplier_Name
order by Total_Cost) AS Row_Num
from automotive_manufacture;

#Find the latest order for each supplier using ROW_NUMBER().
select Supplier_Name,
Order_ID,
row_number() over(
partition by Supplier_Name
order by Total_Cost) AS Row_Num
from automotive_manufacture;

#RANK
#Rank all orders based on Total_Cost from highest to lowest.
select Total_Cost, Order_ID,
rank() over(
order by Total_Cost desc) AS Row_Rank
from automotive_manufacture;

#Rank suppliers based on their average lead time.
select Supplier_Name,
avg(Lead_Time_Days), 
rank() over(
order by avg(Lead_Time_Days) asc) AS Supplier_Rank
from automotive_manufacture
group by Supplier_Name;

#Rank orders based on Ordered_Qty within each region.
select Region, Ordered_Qty, Order_ID,
rank() over(
partition by Region
order by Ordered_Qty desc) AS Region_Rank
from automotive_manufacture;

#Find the second-highest order cost using DENSE_RANK().
select *from 
(select Total_Cost, Order_ID,
dense_rank() over(
order by Total_Cost desc) AS Cost_Rank
from automotive_manufacture
) AS Total_order
where Cost_Rank = 2;

#Find the top 3 highest-cost orders for each supplier.
select*from 
(select Supplier_Name,Total_Cost,Order_ID,
dense_rank() over(
partition by Supplier_Name
order by Total_Cost desc) AS cost_rank
from automotive_manufacture
) AS Total_Order
where Cost_Rank = 3;





