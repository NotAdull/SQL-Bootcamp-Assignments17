SET NOCOUNT ON;

with harry_potter as (
    select 
    w.id, 
    wp.age, 
    w.coins_needed, 
    w.power,
    MIN(w.coins_needed) OVER (PARTITION BY wp.age, w.power) as harga_termurah
from wands w 
join wands_property wp ON w.code = wp.code 
WHERE wp.is_evil = 0
)

select 
    id,
    age,
    coins_needed,
    power 
from harry_potter
where coins_needed = harga_termurah
order by 
    power desc,
    age desc
    
go