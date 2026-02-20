SET NOCOUNT ON;
WITH gabungan1 as (
    select 
      d.score as skor,
      c.challenge_id
    from difficulty d 
    JOIN challenges c ON c.difficulty_level = d.difficulty_level
),

gabungan2 AS (
    SELECT 
        s.hacker_id,                       
        COUNT(s.challenge_id) AS jumlah_menang 
    FROM Submissions s
    JOIN gabungan1 g1 ON s.challenge_id = g1.challenge_id
    WHERE s.score = g1.skor        
    GROUP BY s.hacker_id                   
    HAVING COUNT(s.challenge_id) > 1       
)

select 
  g2.hacker_id,
  h.name 
from gabungan2 g2
join Hackers h ON g2.hacker_id = h.hacker_id
order by 
  g2.jumlah_menang DESC,
  g2.hacker_id ASC
go