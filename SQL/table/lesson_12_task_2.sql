set ansi_nulls, ansi_padding, quoted_identifier on;
go

if object_id('dbo.students') is null
    create table dbo.students (
        student_id          int           not null identity(1, 1),
        student_first_name  nvarchar(100) not null,
        student_last_name   nvarchar(100) not null,
       constraint student_id_pk primary key clustered (student_id) with (fillfactor = 100, pad_index = off, statistics_norecompute = off, allow_row_locks = on)
    )
go
