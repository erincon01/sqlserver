

-- cursores por query
-- sesion, query, cantidad
select c.session_id, t.text, count(*) cantidad
from sys.dm_exec_cursors(0) c
cross apply sys.dm_exec_sql_text (c.sql_handle) t
group by c.session_id, t.text
order by cantidad desc
go

-- propiedades cursores 
-- sesiones, propiedades del cursor, cantidad
select c.session_id, c.properties, count(*) cantidad
from sys.dm_exec_cursors(0) c
group by c.session_id, c.properties
order by cantidad desc
go

-- plan cache
-- top 20 order by cpu time

SELECT TOP 20 
    SUBSTRING(qt.TEXT, (qs.statement_start_offset/2)+1,
    ((CASE qs.statement_end_offset
         WHEN -1 THEN DATALENGTH(qt.TEXT)
         ELSE qs.statement_end_offset
      END - qs.statement_start_offset)/2)+1) as query,
    qs.execution_count,
    qs.total_logical_reads, qs.last_logical_reads,
    qs.total_logical_writes, qs.last_logical_writes,
    qs.total_worker_time, qs.last_worker_time,
    qs.total_elapsed_time/1000000 total_elapsed_time_in_S,
    qs.last_elapsed_time/1000000 last_elapsed_time_in_S,
    qs.last_execution_time,
    qp.query_plan
FROM 
    sys.dm_exec_query_stats qs
CROSS APPLY 
    sys.dm_exec_sql_text(qs.sql_handle) qt
CROSS APPLY 
    sys.dm_exec_query_plan(qs.plan_handle) qp
ORDER BY 
    qs.total_worker_time DESC -- CPU time
go
	

-- conexiones abiertas
select * from sys.dm_exec_connections


-- distribución de memoria 

select type, name, cast( pages_kb * 1.0 / (1024*1024) as decimal(10,2)) gb
from sys.dm_os_memory_clerks
order by pages_kb desc
go



	