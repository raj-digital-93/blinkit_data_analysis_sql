select * from blinkit_data

--  Total Sales by Fat Content
select Item_Fat_Content,round(sum(total_Sales),2) as totalsales 
from blinkit_data
group by Item_Fat_Content

-- Total Sales by Item Type
select Item_Type,round(sum(total_Sales),2) as totalsales 
from blinkit_data
group by Item_Type

-- Fat Content by Outlet for Total Sales 
select outlet_location_type, 
-- Pivot the data
round(SUM(CASE WHEN item_fat_content='Low Fat' THEN total_sales END),2) AS Low_Fat,
round(SUM(CASE WHEN item_fat_content='Regular' THEN total_sales END),2) AS Regular
from blinkit_data
group  by outlet_location_type
order by outlet_location_type

-- Total Sales by Outlet Establishment
select Outlet_Establishment_year as Yearno,round(sum(total_Sales),2) as totalsales 
from blinkit_data
group by Outlet_Establishment_year
order by Outlet_Establishment_year

-- Percentage of Sales by Outlet Size
with cte_outlet as
(
select Outlet_Size,
round(sum(total_sales),2) as outletsales
from blinkit_data
group by Outlet_Size
)

select Outlet_Size,outletsales,
concat(ROUND((outletsales / SUM(outletsales) OVER()) * 100,2),'%') AS outlet_sales_percent
from cte_outlet

-- Sales by Outlet Location
select outlet_location_type,
round(sum(total_sales),2) as Totalsales from blinkit_data
group by outlet_location_type

-- All Metrics by Outlet Type
Select outlet_type,
round(sum(total_sales),2) as totalsales,
round(avg(total_sales),2) as avgsales,
count(*) as No_of_items,
round(avg(rating),2) as avg_rating,
round(avg(item_visibility),2) as Item_visibility
from blinkit_data
group by outlet_type

