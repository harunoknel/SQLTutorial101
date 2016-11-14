--En �ok Cpu T�keten �lk 50 Sorgu
select
	q.[text],
	SUBSTRING(q.text,(qs.statement_start_offset/2)+1,
		((case qs.statement_end_offset
		when -1 then DATALENGTH(q.text)
		else qs.statement_end_offset
		end - qs.statement_start_offset)/2)+1) as statement_text,
	qs.last_execution_time,
	qs.execution_count,
	qs.total_worker_time/1000000 as total_cpu_time_sn,
	qs.total_worker_time/qs.execution_count/1000 as avg_cpu_time_ms,
	qp.query_plan,
	DB_NAME(q.dbid) as database_name,
	q.objectid,
	q.number,
	q.encrypted
from	
	(select top 50 
		qs.last_execution_time,
		qs.execution_count,
		qs.plan_handle,
		qs.total_worker_time,
		qs.statement_start_offset,
		qs.statement_end_offset
	from sys.dm_exec_query_stats qs
	order by qs.total_worker_time desc) qs
	cross apply sys.dm_exec_sql_text ( plan_handle) q
	cross apply sys.dm_exec_query_plan (plan_handle) qp
	order by qs.total_worker_time desc