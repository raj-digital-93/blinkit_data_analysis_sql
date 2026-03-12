select count(*) from blinkit_data;

-- Rename values in columns

update blinkit_data set
Item_Fat_Content=
case 
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content='reg' then 'Regular'
else Item_Fat_Content
end

select distinct(Item_Fat_Content) from blinkit_data

