---- Find the hotel with the maximum discount in each place and rank all 
---- hotels by discount in that place.

select "Hotel_Name","Place","Discount", 
Dense_Rank() over(partition by "Place" order by "Discount" desc) as discount_rank
from hotels_data;