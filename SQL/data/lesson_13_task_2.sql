set identity_insert dbo.directions on
go

merge dbo.directions as trg
using (
  select top 0 direction_id, direction_name, min_exam_score
  from dbo.directions
  union all
  select 1, 'История', 160
  union all
  select 2, 'Право', 180
  union all
  select 3, 'Физика', 200
) as src on (trg.direction_id = src.direction_id)
when matched then
  update set
    direction_name  = src.direction_name,
    min_exam_score   = src.min_exam_score
when not matched then
  insert (direction_id, direction_name, min_exam_score)
  values (src.direction_id, src.direction_name, src.min_exam_score);
go

set identity_insert dbo.directions off
go
