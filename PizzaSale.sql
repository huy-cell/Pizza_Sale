-- A. Các Chỉ số Hiệu suất Chính (KPIs)
SELECT SUM(total_price) AS total_revenue FROM pizza_sales; -- Tổng doanh thu

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value  
FROM pizza_sales; -- Giá trị trung bình mỗi đơn hàng

SELECT SUM(quantity) AS Total_Pizza_Sold  
FROM pizza_sales; -- Tổng số pizza bán ra

SELECT COUNT(DISTINCT order_id) AS Total_Orders  
FROM pizza_sales; -- Tổng số đơn hàng

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS 
Avg_Pizzas_Per_Order FROM pizza_sales; -- Số lượng trung bình của pizza trên mỗi đơn hàng

-- B. Xu hướng Hàng ngày cho Tổng số Đơn hàng 
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS 
Total_orders  
FROM pizza_sales 
GROUP BY DATENAME(DW, order_date); 

-- C. Xu hướng Hàng tháng cho Đơn hàng 
SELECT DATENAME(MONTH, order_date) AS Month_Name , COUNT(DISTINCT order_id) AS 
Total_Orders 
FROM pizza_sales 
GROUP BY DATENAME(MONTH, order_date) 
ORDER BY Total_Orders DESC; 

-- D. Tỷ lệ Doanh số của Danh mục Pizza 
SELECT pizza_category, SUM(total_price) AS Total_Sales,SUM(total_price)  * 100 
/(SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage 
FROM pizza_sales  
GROUP BY pizza_category; 

-- E. Tỷ lệ Doanh số của Kích thước Pizza 
SELECT pizza_size, SUM(total_price) AS Total_Sales,SUM(total_price)  * 100/ 
(SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage 
FROM pizza_sales  
GROUP BY pizza_size;

-- F. Tổng số Pizza bán ra theo Danh mục Pizza 
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold  
FROM pizza_sales 
GROUP BY pizza_category 
ORDER BY Total_Quantity_Sold DESC;

-- G. Top 5 Pizza theo Doanh thu 
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue  
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Revenue DESC;

-- H. 5 Pizza có Tổng số Đơn hàng cao nhất
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Orders DESC;

-- I. Top 5 Pizza theo Số lượng 
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Pizza_Sold DESC;

-- J. 5 Pizza có Số lượng Đơn hàng thấp nhất
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales 
GROUP BY pizza_name 
ORDER BY Total_Orders ASC;

