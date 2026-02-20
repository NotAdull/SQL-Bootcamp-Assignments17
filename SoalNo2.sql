SET NOCOUNT ON;

with jarak as (
    select 
        MIN(LAT_N) as a,
        MIN(LONG_W) as b,
        MAX(LAT_N) as C,
        MAX(LONG_W) AS D
    from station
)

select  
    CAST(ABS(a - c) + ABS(b - d) AS DECIMAL(10,4))
from jarak
go