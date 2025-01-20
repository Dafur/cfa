set ansi_nulls, ansi_padding, quoted_identifier on;
go

if object_id('dbo.directions') is null
    create table dbo.directions (
        direction_id    int           not null identity(1, 1),
        direction_name  nvarchar(100) not null,
        min_exam_score  nvarchar(100)     null,
       constraint directions_pk primary key clustered (direction_id) with (fillfactor = 100, pad_index = off, statistics_norecompute = off, allow_row_locks = on)
    )
go
