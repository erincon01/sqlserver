
drop table medidas;
create table medidas (tipo sysname, iter int, duracion bigint)
go

declare @sql_pattern nvarchar(4000);
set nocount on;

set @sql_pattern = '
DECLARE @id int, @d1 datetime, @d2 datetime, @s1 sysname, @s2 sysname, @s3 sysname;
DECLARE @iterar int = 1; 

DECLARE cx CURSOR 
<cursor_type>

FOR
  SELECT 
	c1.[object_id] id, c1.create_date d1, c2.create_date d2,
	c1.name s1, c1.type_desc s2, c2.type_desc s3
    FROM sys.objects AS c1
    CROSS JOIN sys.objects AS c2
    CROSS JOIN (select top 3 * from sys.databases) AS c3;
 
OPEN cx;
FETCH NEXT FROM cx 
INTO @id, @d1, @d2, @s1, @s2, @s3;
 
-- se itera el cursor a medias 5k filas
WHILE (@@FETCH_STATUS = 0 and @iterar <= 5000)
BEGIN
	SET @iterar += 1; -- iterar para nada
	FETCH NEXT FROM cx 
	INTO @id, @d1, @d2, @s1, @s2, @s3;
END
 
-- no cerrar para buscar leak
--  CLOSE cx;
--  DEALLOCATE cx;
'

declare @i int=1;
declare @d1 datetime;
declare @sql nvarchar(4000);
while (@i<=10)
begin
	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'FORWARD_ONLY STATIC ');
	set @sql = REPLACE(@sql,'cx', 'c_forward_only_static___' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'FORWARD_ONLY STATIC ', @i, datediff (MILLISECOND, @d1, getdate());

	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'FORWARD_ONLY KEYSET ');
	set @sql = REPLACE(@sql,'cx', 'c_forward_only_key______' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'FORWARD_ONLY KEYSET ', @i, datediff (MILLISECOND, @d1, getdate());

	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'FORWARD_ONLY DYNAMIC ');
	set @sql = REPLACE(@sql,'cx', 'c_forward_only_dynamic__' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'FORWARD_ONLY DYNAMIC ', @i, datediff (MILLISECOND, @d1, getdate());

	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'FORWARD_ONLY FAST_FORWARD ');
	set @sql = REPLACE(@sql,'cx', 'c_forward_only_fforward_' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'FORWARD_ONLY FAST_FORWARD ', @i, datediff (MILLISECOND, @d1, getdate());

	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'SCROLL STATIC ');
	set @sql = REPLACE(@sql,'cx', 'c_scroll_static_________' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'SCROLL STATIC ', @i, datediff (MILLISECOND, @d1, getdate());

	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'SCROLL KEYSET ');
	set @sql = REPLACE(@sql,'cx', 'c_scroll_keyset_________' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'SCROLL KEYSET ', @i, datediff (MILLISECOND, @d1, getdate());

	set @sql = REPLACE(@sql_pattern,'<cursor_type>', 'SCROLL DYNAMIC ');
	set @sql = REPLACE(@sql,'cx', 'c_scroll_dynamic________' + cast(@i as varchar(5)));
	set @d1 = getdate()
	exec sp_executesql @sql
	insert into medidas select 'SCROLL DYNAMIC ', @i, datediff (MILLISECOND, @d1, getdate());

	set @i = @i +1;
end
