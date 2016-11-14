use BACKUPTESTDB;
-- Cache'lenen Strored Procedure'lerin Query Planlarý
select DB_NAME(st.dbid) as DBName,
	OBJECT_SCHEMA_NAME(st.objectid, st.dbid) as SchemaName,
	OBJECT_NAME(st.objectid,st.dbid) as ObjectName,
	st.text,
	qp.query_plan,
	cp.usecounts,
	cp.size_in_bytes
from sys.dm_exec_cached_plans cp
cross apply sys.dm_exec_query_plan(cp.parent_plan_handle) qp
cross apply sys.dm_exec_sql_text(cp.plan_handle) st
where st.dbid<>32767
and cp.objtype='proc'

