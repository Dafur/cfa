
create or alter procedure usp_directionStudents @directionId int
as

set nocount on

if not exists(select 1 from dbo.directions where direction_id = @directionId)
  raiserror('Некорректный код направления', 11, 1)

select
    Direction = d.direction_name
  , Students  = stuff(
                  cast(
                      (
                      select [text()] = ', ' + student_last_name
                      from
                      (
                        select student_last_name
                        from dbo.students s
                        join dbo.directions d on d.direction_id = s.direction_id
                        where d.direction_id = @directionId
                          and s.exam_score >= d.min_exam_score
                      ) S
                      for xml path(''), type
                      )
                    as varchar(max)
                    )
                  , 1, 2 ,''
                  )
from dbo.directions d
where d.direction_id = @directionId

go
