
select s.*
  , d.min_exam_score
  , [Зачислен] = case
            when s.exam_score >= d.min_exam_score then 'Да'
            when s.exam_score < d.min_exam_score then 'Нет'
            else null
            end
from dbo.students s
left join dbo.directions d on d.direction_id = s.direction_id
