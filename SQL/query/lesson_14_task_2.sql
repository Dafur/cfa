
select stuff(
  cast(
      (
      select [text()] = ', ' + convert(varchar(max), student_last_name)
      from
      (
        select student_last_name
        from dbo.students s
        join dbo.directions d on d.direction_id = s.direction_id
        where d.direction_id = 1 --История
          and s.exam_score >= d.min_exam_score
      ) S
      for xml path(''), type
      )
    as varchar(max)
    )
  , 1, 2 ,''
  ) as Students
