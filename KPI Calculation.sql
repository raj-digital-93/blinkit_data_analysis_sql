select * from blinkit_data;
show columns from blinkit_data;

-- TOTAL SALES
select round(sum(Total_Sales),2) as Total_Sales from blinkit_data;

-- AVERAGE SALES - Average Revenue per sale
select round(cast(avg(total_sales) as float),2) as Avg_Sales from blinkit_data;

-- NUMBER OF ITEMS
select count(*) as No_of_orders
from blinkit_data;

-- AVG RATING
select round(avg(rating),2) as avg_rating from blinkit_data;





