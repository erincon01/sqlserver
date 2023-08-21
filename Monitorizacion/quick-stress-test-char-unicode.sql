set nocount on
go
drop table dbo.tc;
go
drop table dbo.tcn;
go

create table dbo.tc
(id int identity, c char(500) default 'a', _date datetime default getdate())
go
create clustered index ci_tc on dbo.tc(id) --with (data_compression = page);
go
create table dbo.tcn
(id int identity, c nchar(500) default 'a', _date datetime default getdate())
go
create clustered index ci_tcn on dbo.tcn(id) --with (data_compression = page);
go

-- char
exec qpi.snapshot_wait_stats
exec qpi.snapshot_file_stats
go

insert into dbo.tc (c)
select top 5000
c1.name + cast(c1.column_id as varchar(100)) 
+ '_' + cast(c1.system_type_id as varchar(100)) 
+ '_' + cast(c1.user_type_id as varchar(100)) + c1.name + cast(c1.column_id as varchar(100)) 
+ '_' + cast(c1.system_type_id as varchar(100)) 
+ '_' + cast(c1.user_type_id as varchar(100)) 
from sys.all_columns c1 order by newid()
go 100

select datediff(ms,min(_date), max(_date)) diff,  min(_date) _start, max(_date) _end from dbo.tc;
select * from qpi.file_stats; 
select * from qpi.wait_stats;
go

-- nchar
exec qpi.snapshot_wait_stats
exec qpi.snapshot_file_stats
go

insert into dbo.tcn (c)
select top 5000
c1.name + cast(c1.column_id as varchar(100)) 
+ '_' + cast(c1.system_type_id as varchar(100)) 
+ '_' + cast(c1.user_type_id as varchar(100)) + c1.name + cast(c1.column_id as varchar(100)) 
+ '_' + cast(c1.system_type_id as varchar(100)) 
+ '_' + cast(c1.user_type_id as varchar(100)) 
from sys.all_columns c1 order by newid()
go 100

select datediff(ms,min(_date), max(_date)) diff,  min(_date) _start, max(_date) _end from dbo.tcn;
select * from qpi.file_stats; 
select * from qpi.wait_stats; 




