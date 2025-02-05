set ansi_nulls, ansi_padding, quoted_identifier on;
go

if columnproperty(object_id('dbo.directions'), 'total_seats', 'ColumnId') is null
  alter table dbo.directions add total_seats int null
go

if columnproperty(object_id('dbo.directions'), 'recruitment_complete', 'ColumnId') is null
  alter table dbo.directions add recruitment_complete bit null
go
