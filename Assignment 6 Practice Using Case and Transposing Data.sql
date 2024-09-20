SELECT name, total_supply,

CASE WHEN total_supply < 20000 THEN 'LOW'

     WHEN total_supply >= 20000 AND total_supply <= 50000 THEN 'ENOUGH'

     WHEN total_supply > 50000 THEN 'FULL'

END as category
FROM (

SELECT name, sum(supply) total_supply

FROM fruit_imports

GROUP BY name

    ) a


---------------------------------------------------------------------------------------------------------------

Select sum(case when season = 'Winter' then cost_to_imports end) as Winter_total,
	 sum(case when season = 'Summer' then cost_to_imports end) as Summer_total, 
	 sum(case when season = 'Spring' then cost_to_imports end) as Spring_total, 
	 sum(case when season = 'fall' then cost_to_imports end) as fall_total, 
	 sum(case when season = 'All Year' then cost_to_imports end) as allyear_total 
from(
Select season, sum(supply * cost_per_unit) cost_to_imports
from fruit_imports
group by season
)  a 


























