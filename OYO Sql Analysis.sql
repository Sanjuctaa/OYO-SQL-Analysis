---- Find the hotel with the maximum discount in each place and rank all 
---- hotels by discount in that place.

select "Hotel_Name","Place","Discount", 
Dense_Rank() over(partition by "Place" order by "Discount" desc) as discount_rank
from hotels_data;

----- Find the top 3 locations with the highest average hotel rating.

select "Location", round(avg("Rating"),2) as avg_rate
from hotels_data
group by 1
order by 2 desc
limit 3;

----  Find the top 10 Hotels with the highest average number of hotel rating.

select "Hotel_Name", avg("Rating") as avg_rate
from hotels_data
group by 1
order by 2 desc
limit 10;

--- determine the number of oyo hotels in each city

select "Place", count(*) as number_of_hotels
from hotels_data
group by 1
order by 2 desc;


----Calculate the revenue according to place.

select "Place",sum("Price") as revenue
from hotels_data
group by 1
order by 2 desc;


---	Basic CASE Statements:  Categorize hotels into 'Luxury', 'Budget', and 'Economy' based on their prices:
--- Luxury: Price > 10,000
--- Budget: 5,000 <= Price <= 10,000
---	Economy: Price < 5,000

select "Hotel_Name","Place",   
CASE
WHEN "Price" > 3000 THEN 'Luxury'
WHEN "Price" BETWEEN 1000 AND 3000 THEN 'Budget'
ELSE 'Economy'
END AS Price_Category
from hotels_data;


