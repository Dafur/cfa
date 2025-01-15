set identity_insert dbo.students on
go

merge dbo.students as trg
using (
  select top 0 student_id, student_first_name, student_last_name, exam_score, direction
  from dbo.students
  union all
  select 1, 'Иван', 'Бунша', 220, 'История'
  union all
  select 2, 'Остап', 'Бендер', 170, 'Право'
  union all
  select 3, 'Александр', 'Тимофеев', 300, 'Физика'
) as src on (trg.student_id = src.student_id)
when matched then
  update set
    student_first_name  = src.student_first_name,
    student_last_name   = src.student_last_name,
    exam_score          = src.exam_score,
    direction           = src.direction
when not matched then
  insert (student_id, student_first_name, student_last_name, exam_score, direction)
  values (src.student_id, src.student_first_name, src.student_last_name, src.exam_score, src.direction);
go

set identity_insert dbo.students off
go
