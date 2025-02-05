
with src as (
  select *
  from (values
      (1, 2)
    , (2, 2)
    , (3, 1)
  ) s(direction_id, total_seats)
)
update d set total_seats = src.total_seats
from dbo.directions d
join src on src.direction_id = d.direction_id
go
