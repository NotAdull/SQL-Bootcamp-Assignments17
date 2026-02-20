SET NOCOUNT ON;

with join1 as (
    select 
        s.Name,
        G.Grade,
        s.Marks
    from students s 
    join Grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
)

select 
    case 
        when grade < 8 then 'NULL'
        else Name
    end as Name,
    Grade,
    marks
from join1 
ORDER BY 
    grade DESC, 
    name ASC, 
    marks ASC
go