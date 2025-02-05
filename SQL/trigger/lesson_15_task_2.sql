
create or alter trigger dbo.trg_students_ins_upd on dbo.students after insert, update
as
begin

  set ansi_warnings off;

  with s as (
      select d.direction_id, count(s.student_id) as students_count
      from dbo.directions d
      left join dbo.students s on s.direction_id = d.direction_id
        and s.exam_score >= d.min_exam_score
      group by d.direction_id
    )
  update d set recruitment_complete = iif(s.students_count >= d.total_seats, 1, 0)
  from s
  join dbo.directions d on d.direction_id = s.direction_id;

end
go
