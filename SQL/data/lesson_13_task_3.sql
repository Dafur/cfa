update s set direction_id = d.direction_id
from dbo.students s
inner join dbo.directions d on d.direction_name = s.direction
where s.direction_id != d.direction_id
  or s.direction_id is null
go
