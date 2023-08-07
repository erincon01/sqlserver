
/*

https://learn.microsoft.com/en-us/sql/relational-databases/performance-monitor/sql-server-cursor-manager-by-type-object?view=sql-server-ver16
https://www.sqlshack.com/using-sql-server-cursors-advantages-and-disadvantages/
https://learn.microsoft.com/en-us/sql/relational-databases/cursors?redirectedfrom=MSDN&view=sql-server-ver16
https://www.mssqltips.com/sqlservertip/1599/cursor-in-sql-server/
https://learn.microsoft.com/es-es/sql/t-sql/language-elements/declare-cursor-transact-sql?view=sql-server-ver16

DECLARE cursor_name CURSOR [ LOCAL | GLOBAL ]   
     [ FORWARD_ONLY | SCROLL ]   
     [ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]   
     [ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]   
     [ TYPE_WARNING ]   
     FOR select_statement   
     [ FOR UPDATE [ OF column_name [ ,...n ] ] ]  

	 FORWARD_ONLY STATIC
	 FORWARD_ONLY KEYSET
	 FORWARD_ONLY DYNAMIC
	 FORWARD_ONLY FAST_FORWARD

	 SCROLL STATIC
	 SCROLL KEYSET
	 SCROLL DYNAMIC
	 -- SCROLL FAST_FORWARD INCOMPATIBLE

-- https://techcommunity.microsoft.com/t5/sql-server-blog/cursors-and-memory-scalability-in-sql-server-2005/ba-p/383068
-- DIAGNOSIS
--

select sql_handle from sys.dm_exec_cursors (@@spid)
select sql_handle from sys.dm_exec_cursors (0)

select p.plan_handle from
sys.dm_exec_cached_plans p
cross apply sys.dm_exec_plan_attributes(p.plan_handle) pa
where pa.attribute = 'sql_handle' AND pa.value = <sql handle from step 1>

select * from sys.dm_exec_query_plan(<plan_handle from step 2>).
select memory_object_address from sys.dm_exec_cached_plans where plan_handle = <plan_handle from step 2>
select memory_object_address from sys.dm_os_memory_objects where type = 'MEMOBJ_CURSOREXEC'

dbcc freeproccache

drop table medidas;
create table medidas (tipo sysname, iter int, duracion bigint)

select tipo, count(*) c, sum(duracion) duracion from medidas (nolock)
group by tipo
order by 3 desc

-- tiempo total por grupo
select left(name, 24) name, properties, count(*) c, avg(worker_time) avg, sum(worker_time) worker_time from sys.dm_exec_cursors (0)
group by left(name, 24), properties
order by worker_time desc


select left(c.name, 24) name, c.properties, cast(sum(mo.pages_in_bytes) * 1.0 / (1024*1024) as decimal(10,2)) mb from
sys.dm_exec_cursors (0) c
join (
select * from sys.dm_exec_cached_plans p
cross apply sys.dm_exec_plan_attributes(p.plan_handle) pa
) v on v.attribute = 'sql_handle' AND v.value = c.sql_handle
join sys.dm_os_memory_objects mo
on v.memory_object_address = mo.memory_object_address
group by left(c.name, 24), c.properties
order by mb
--where type = 'MEMOBJ_CURSOREXEC'

SELECT database_transaction_log_bytes_reserved,session_id 
  FROM sys.dm_tran_database_transactions AS tdt 
  INNER JOIN sys.dm_tran_session_transactions AS tst 
  ON tdt.transaction_id = tst.transaction_id 
  WHERE database_id = 2;



  ;WITH task_space_usage AS (
    -- SUM alloc/delloc pages
    SELECT session_id,
           request_id,
           SUM(internal_objects_alloc_page_count) AS alloc_pages,
           SUM(internal_objects_dealloc_page_count) AS dealloc_pages
    FROM sys.dm_db_task_space_usage WITH (NOLOCK)
    WHERE session_id <> @@SPID
    GROUP BY session_id, request_id
)
SELECT TSU.session_id,
       TSU.alloc_pages * 1.0 / 128 AS [internal object MB space],
       TSU.dealloc_pages * 1.0 / 128 AS [internal object dealloc MB space],
       EST.text,
       -- Extract statement from sql text
       ISNULL(
           NULLIF(
               SUBSTRING(
                 EST.text, 
                 ERQ.statement_start_offset / 2, 
                 CASE WHEN ERQ.statement_end_offset < ERQ.statement_start_offset 
                  THEN 0 
                 ELSE( ERQ.statement_end_offset - ERQ.statement_start_offset ) / 2 END
               ), ''
           ), EST.text
       ) AS [statement text],
       EQP.query_plan
FROM task_space_usage AS TSU
INNER JOIN sys.dm_exec_requests ERQ WITH (NOLOCK)
    ON  TSU.session_id = ERQ.session_id
    AND TSU.request_id = ERQ.request_id
OUTER APPLY sys.dm_exec_sql_text(ERQ.sql_handle) AS EST
OUTER APPLY sys.dm_exec_query_plan(ERQ.plan_handle) AS EQP
WHERE EST.text IS NOT NULL OR EQP.query_plan IS NOT NULL
ORDER BY 3 DESC;


*/



select sql_handle from sys.dm_exec_cursors (@@spid)
select sql_handle from sys.dm_exec_cursors (0)

select p.plan_handle from
sys.dm_exec_cached_plans p
cross apply sys.dm_exec_plan_attributes(p.plan_handle) pa
where pa.attribute = 'sql_handle' AND pa.value = <sql handle from step 1>

select * from sys.dm_exec_query_plan(<plan_handle from step 2>).

select memory_object_address from sys.dm_exec_cached_plans where plan_handle = <plan_handle from step 2>

select memory_object_address from sys.dm_os_memory_objects where type = 'MEMOBJ_CURSOREXEC'






sys.dm_exec_cached_plans p
cross apply sys.dm_exec_plan_attributes(p.plan_handle) pa
on c.sql_handle = pa.value
cross apply sys.dm_exec_query_plan(p.plan_handle)


join sys.dm_os_memory_objects mo 
on mo.memory_object_address = p.memory_object_address  
where mo.type = 'MEMOBJ_CURSOREXEC'


select memory_object_address from sys.dm_exec_cached_plans where plan_handle = <plan_handle from step 2>


where pa.attribute = 'sql_handle' AND pa.value = <sql handle from step 1>




-- tiempo total por grupo
select left(name, 24) name, properties, count(*) c, avg(worker_time) avg, sum(worker_time) worker_time 
select top 100 * 
from sys.dm_exec_cursors (0)
group by left(name, 24), properties
order by worker_time desc





DECLARE @id int, @d1 datetime, @d2 datetime, @s1 sysname, @s2 sysname, @s3 sysname;
DECLARE @iterar int = 1;
 
DECLARE c1 CURSOR 
FAST_FORWARD FORWARD_ONLY
FOR
  SELECT 
	c1.[object_id] id, c1.create_date d1, c2.create_date d2,
	c1.name s1, c1.type_desc s2, c2.type_desc s3
    FROM sys.objects AS c1
    CROSS JOIN sys.objects AS c2
    CROSS JOIN (select top 3 * from sys.databases) AS c3;
 
OPEN c1;
FETCH NEXT FROM c1 
INTO @id, @d1, @d2, @s1, @s2, @s3;
 
-- se itera el cursor a medias 5k filas
WHILE (@@FETCH_STATUS = 0 and @iterar <= 5000)
BEGIN
	SET @iterar += 1; -- iterar para nada
	FETCH NEXT FROM c1 
	INTO @id, @d1, @d2, @s1, @s2, @s3;
END
 
-- no cerrar para buscar leak
--  CLOSE c1;
--  DEALLOCATE c1;

