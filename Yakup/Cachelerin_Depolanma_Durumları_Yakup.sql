SELECT (st.dbid) as DBname,
	OBJECT_SCHEMA_NAME(st.objectid,st.dbid) as SchemaName,
	OBJECT_NAME(st.objectid,st.dbid) as ObjectName,
	st.text,
	qp.query_plan,
	cp.usecounts,
	cp.size_in_bytes
from sys.dm_exec_cached_plans cp
cross apply sys.dm_exec_query_plan(cp.plan_handle) qp
cross apply sys.dm_exec_sql_text(cp.plan_handle) st
where st.dbid<>32767 --Resource DB'yi exclude ediyoruz
	and cp.objtype='proc'
