/*
Answer following questions
--1.What is a result set?
a result set is the result after the sql syntax  manioulation.

--2.What is the difference between Union and Union All?
a) UNION will remove the duplicates, UNION ALL does not.
b) UNOIN: values for first column will be sorted automatically.
c) UNION cannot be used in recursive cte, UNION ALL can.

--3.What are the other Set Operators SQL Server has?
(UNION, UNION ALL) INTERSECT, EXCEPT

--4.What is the difference between Union and Join?
Union is used to combine result sets vertically, while Join is used to combine result sets horizontally

--5.What is the difference between INNER JOIN and FULL JOIN?
INNER JOIN will just keep the common part of two table, FULL JOIN will keep every records of two tables

--6.What is difference between left join and outer join?
left join is a kind of outer join.
left join will keep the first table complete.

--7.What is cross join?
Cross join creates the Cartesian product of two tables, no JOIN CONDITION

--8.What is the difference between WHERE clause and HAVING clause?
a) both used as fileters -> having applies only to groups as a whole, but where applied to individual rows
b) WHERE goes before aggregations, HAVING goes after the aggreagations
   FROM/JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY 

--9.Can there be multiple group by columns?
yes
*/

--Write queries for following scenarios
--1.How many products can you find in the Production.Product table?
SELECT COUNT(*)
FROM Production.Product

--2.Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
SELECT COUNT(ProductID)
FROM Production.Product

/*
3.How many Products reside in each SubCategory? Write a query to display the results with the following titles.
ProductSubcategoryID CountedProducts
-------------------- ---------------
*/
SELECT ProductSubcategoryID,COUNT(ProductID) AS CountedProducts
FROM Production.Product
GROUP BY ProductSubcategoryID

--4.How many products that do not have a product subcategory. 
SELECT COUNT(ProductID) - COUNT(ProductSubcategoryID)
FROM Production.Product

--5.Write a query to list the sum of products quantity in the Production.ProductInventory table.
SELECT SUM(Quantity)
FROM  Production.ProductInventory

/*
6.Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
  ProductID         TheSum
-----------        ----------
*/
SELECT ProductID,COUNT(ProductID) TheSum
FROM  Production.ProductInventory
GROUP BY ProductID

/*
7.Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
   Shelf     ProductID           TheSum
---------- -----------        -----------
*/
SELECT Shelf, ProductID,COUNT(ProductID) TheSum
FROM Production.ProductInventory
GROUP BY Shelf,ProductID

--8.Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
SELECT AVG(Quantity)
FROM Production.ProductInventory
WHERE LocationID = 10

/*
9.Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory
  ProductID   Shelf      TheAvg
----------- ---------- -----------
*/
SELECT ProductID, Shelf, AVG(quantity) as TheAvg
FROM Production.ProductInventory
GROUP BY ProductID,Shelf

/*
10.Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
 ProductID   Shelf      TheAvg
----------- ---------- -----------
*/
SELECT ProductID, Shelf, AVG(quantity) as TheAvg
FROM Production.ProductInventory
WHERE Shelf != "N/A"
GROUP BY ProductID,Shelf

/*
11.	List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.
Color           	Class 	  TheCount   	   AvgPrice
--------------	- ----- 	----------- 	---------------------
Joins:
*/
SELECT Color, Class, Count(ProductID) as TheCount, AVG(ListPrice) AvgPrice
FROM Production.Product
WHERE Color is not null AND Class is not null
GROUP BY Color,Class


/*
12.Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following. 
Country                        Province
---------                ----------------------
*/
SELECT c.CountryRegionCode as Country,s.StateProvinceCode as Province
FROM person.CountryRegion c INNER JOIN person. StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
GROUP BY c.CountryRegionCode,s.StateProvinceCode


/*
13.Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.
  Country                        Province
---------                    ----------------------
*/
SELECT c.CountryRegionCode as Country,s.StateProvinceCode as Province
FROM person.CountryRegion c INNER JOIN person. StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
GROUP BY c.CountryRegionCode,s.StateProvinceCode
HAVING c.CountryRegionCode IN("GM","CA")


--Using Northwnd Database: (Use aliases for all the Joins)
--14.List all Products that has been sold at least once in last 25 years.
SELECT * FROM Orders


--15.List top 5 locations (Zip Code) where the products sold most.
SELECT
FROM 
SELECT*FROM 

--16.List top 5 locations (Zip Code) where the products sold most in last 25 years.


--17.List all city names and number of customers in that city.   
SELECT City,COUNT(CustomerID) "number of customers"
FROM Customers
GROUP BY City


--18.List city names which have more than 2 customers, and number of customers in that city 
SELECT City,COUNT(CustomerID) "number of customers"
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID) >=2

--19.List the names of customers who placed orders after 1/1/98 with order date.
SELECT c.ContactName
FROM Orders o INNER JOIN Customers c ON o.CustomerID=c.CustomerID
WHERE OrderDate > 1/1/98

--20.List the names of all customers with most recent order dates 
SELECT c.ContactName,o.OrderDate
FROM Orders o INNER JOIN Customers c ON o.CustomerID=c.CustomerID
ORDER BY OrderDate desc

--21.Display the names of all customers  along with the  count of products they bought 
SELECT c.ContactName, COUNT(OrderID) "count of products"
FROM Orders o INNER JOIN Customers c ON o.CustomerID=c.CustomerID
GROUP BY c.ContactName

--22.Display the customer ids who bought more than 100 Products with count of products.
SELECT c.CustomerID, COUNT(OrderID) "count of products"
FROM Orders o INNER JOIN Customers c ON o.CustomerID=c.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(OrderID)>100

/*23.List all of the possible ways that suppliers can ship their products. Display the results as below
   Supplier Company Name   	                     Shipping Company Name
---------------------------------            ----------------------------------
*/
SELECT 
FROM Shippers INNER JOIN Suppliers ON

--24.Display the products order each day. Show Order date and Product Name.
SELECT a.OrderID,a.OrderDate,b.ContactName
FROM orders a INNER JOIN Customers b 
ON 
INNER JOIN 
ON 

--25.Displays pairs of employees who have the same job title.
SELECT EmployeeID, Title
FROM Employees
ORDER BY Title

