SET NOCOUNT ON;


with hacker1 as (
    select 
    hacker_id,
    challenge_id,
    MAX(score) as skormax
    from Submissions
    GROUP BY hacker_id, challenge_id
),

hacker2 as (
    select 
    h.hacker_id,
    h.name,
    SUM(h1.skormax) as skoraja
    from Hackers h 
    join hacker1 h1 ON h.hacker_id = h1.hacker_id
    GROUP BY h.hacker_id, h.name 
    having sum(h1.skormax) > 0
)

select * from hacker2
order by 
    skoraja desc,
    hacker_id ASC;

go